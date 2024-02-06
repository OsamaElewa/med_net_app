import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/logic/profile_cubit/profile_cubit.dart';
import 'package:mednet/logic/profile_cubit/profile_state.dart';
import 'package:mednet/select_job_view/select_job_view.dart';

import '../../constants/custom_text_field.dart';
import '../../network/local/cache_helper.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit,ProfileStates>(
        builder: (context, state) {
          ProfileCubit.get(context).nameController.text = CacheHelper.getData(key: 'regName');
          ProfileCubit.get(context).emailController.text = CacheHelper.getData(key: 'regEmail');
          ProfileCubit.get(context).phoneController.text = CacheHelper.getData(key: 'regPhone');
          ProfileCubit.get(context).passwordController.text = CacheHelper.getData(key: 'regPassword');
          print('///////////////////////');
          print(CacheHelper.getData(key: 'regPhone'));
          return Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Column(
              children: [
                SizedBox(height: 35.h,),
                CustomTextField(
                  readOnly: true,
                  textInputType: TextInputType.name,
                  controller:ProfileCubit.get(context).nameController,
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
                SizedBox(height: 15.h,),
                CustomTextField(
                  readOnly: true,
                  textInputType: TextInputType.emailAddress,
                  controller:ProfileCubit.get(context).emailController,
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
                SizedBox(height: 15.h,),
                CustomTextField(
                  readOnly: true,
                  textInputType: TextInputType.visiblePassword,
                  controller: ProfileCubit.get(context).passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  title: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock_outline,color: Colors.white,),
                ),
                SizedBox(height: 15.h,),
                CustomTextField(
                  readOnly: true,
                  textInputType: TextInputType.phone,
                  controller: ProfileCubit.get(context).phoneController,
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
                SizedBox(height: 15.h,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: TextButton(
                      onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SelectJobView(),), (route) => false),
                      child: Text('Logout',style: TextStyle(color: Colors.black),)),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
