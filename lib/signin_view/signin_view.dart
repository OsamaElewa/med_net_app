import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/signin_view/widgets/text_field_sign_in_section.dart';
import 'package:mednet/view/bottom_nav/bottom_nav_screen.dart';

import '../logic/login_bloc/auth_cubit.dart';
import '../logic/login_bloc/auth_states.dart';
import '../signup_view/signup_view.dart';
import '../signup_view/text_field_section.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<AuthCubit,AuthStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: AuthCubit.get(context).formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Let\'s get started',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          const Text('create an account by filling the information below',style: TextStyle(color: Colors.white,),),
                          const SizedBox(height: 25,),
                          TextFieldSignInSection(),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(onPressed: () {

                            }, child: Text('Forgot password?',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)),
                          ),

                          const SizedBox(height: 25,),

                          Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: TextButton(

                              onPressed: () {
                                if(AuthCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()){
                                  CacheHelper.saveData(key: 'name', value: AuthCubit.get(context).emailController.text);
                                  CacheHelper.saveData(key: 'password', value: AuthCubit.get(context).passwordController.text);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppLayout(),));
                                }
                              },
                              child: const Text('Sign In',style: TextStyle(color: Colors.black,fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',style: TextStyle(color: Colors.white),),
                          TextButton(onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupView(),));
                          }, child: Text('Sign up',style: TextStyle(color: Colors.amber),),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
