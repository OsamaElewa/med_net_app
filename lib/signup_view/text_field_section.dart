import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/register_cubit/register_cubit.dart';
import 'package:mednet/logic/register_cubit/register_state.dart';

import '../constants/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit,RegisterStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.name,
              controller:RegisterCubit.get(context).nameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              title: 'Name',
              hintText: 'Enter your Name',
              prefixIcon: const Icon(Icons.email_outlined,color: Colors.white,),
            ),
            CustomTextField(
              textInputType: TextInputType.emailAddress,
              controller:RegisterCubit.get(context).emailController,
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
              textInputType: TextInputType.visiblePassword,
              controller: RegisterCubit.get(context).passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              title: 'Password',
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock_outline,color: Colors.white,),
              obscureText: RegisterCubit.get(context).securePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  RegisterCubit.get(context).changePasswordVisibility();
                },
                icon: Icon(RegisterCubit.get(context).securePassword? Icons.visibility : Icons.visibility_off,color: Colors.white,)),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.phone,
              controller: RegisterCubit.get(context).phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              title: 'Phone number',
              hintText: 'Enter your phone number',
              prefixIcon: const Icon(Icons.phone,color: Colors.white,),
            ),
          ],
        );
      },
    );
  }
}
