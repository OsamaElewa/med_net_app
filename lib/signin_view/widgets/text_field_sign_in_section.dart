import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../constants/custom_text_field.dart';
import '../../logic/login_bloc/auth_cubit.dart';
import '../../logic/login_bloc/auth_states.dart';

class TextFieldSignInSection extends StatelessWidget {
  TextFieldSignInSection({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller:AuthCubit.get(context).emailController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
              title: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller: AuthCubit.get(context).passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              title: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock_outline,color: Colors.white,),
              suffixIcon: Icon(Icons.visibility_off,color: Colors.white,),
            ),
          ],
        );
      },
    );
  }
}
