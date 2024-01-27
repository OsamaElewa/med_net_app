import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/constants/show_snack_bar.dart';
import 'package:mednet/logic/register_cubit/register_cubit.dart';
import 'package:mednet/logic/register_cubit/register_state.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/signin_view/signin_view.dart';
import 'package:mednet/signup_view/text_field_section.dart';
import 'package:mednet/view/bottom_nav/bottom_nav_screen.dart';

import '../constants/custom_text_field.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        ),
        body: BlocConsumer<RegisterCubit,RegisterStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: RegisterCubit.get(context).formKey,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Let\'s get started',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                          const Text('create an account by filling the information below',style: TextStyle(color: Colors.white,),),
                          const SizedBox(height: 25,),
                          TextFieldSection(),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Colors.amber,
                                value: true,
                                onChanged: (value) {
                                },
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('By check the box you are agree the terms and',
                                    style: TextStyle(color: Colors.white,),
                                  ),
                                  Text('conditions and privacy policy',
                                    style: TextStyle(color: Colors.white,),
                                  ),
                                ],
                              ),
                            ],
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
                                if(RegisterCubit.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()){
                                  CacheHelper.saveData(key: 'regName', value: RegisterCubit.get(context).nameController.text);
                                  CacheHelper.saveData(key: 'regEmail', value: RegisterCubit.get(context).emailController.text);
                                  CacheHelper.saveData(key: 'regPassword', value: RegisterCubit.get(context).passwordController.text);
                                  CacheHelper.saveData(key: 'regPhone', value: RegisterCubit.get(context).phoneController.text);
                                  print(CacheHelper.getData(key: 'regName'));
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AppLayout(),));
                                  showSuccessSnackBar(context: context, message: 'Sign up is done successfully');
                                }
                              },
                              child: const Text('Sign Up',style: TextStyle(color: Colors.black,fontSize: 18),),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',style: TextStyle(color: Colors.white),),
                          TextButton(onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SigninView(),));
                          }, child: Text('Sign in',style: TextStyle(color: Colors.amber),),)
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
