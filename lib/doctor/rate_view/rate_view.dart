import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/doctor/rate_view/cubit/rate_cubit.dart';
import 'package:mednet/doctor/rate_view/cubit/rate_state.dart';
import 'package:mednet/doctor/rate_view/widgets/text_field_section.dart';

import '../../constants/show_snack_bar.dart';
import '../../network/local/cache_helper.dart';

class RateView extends StatelessWidget {
  const RateView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RateCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
        ),
        body: BlocBuilder<RateCubit,RateStates>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Form(
                    key: RateCubit.get(context).formKey,
                    child: Column(
                      children: [
                         Text('Let\'s Rate the service and send it to company',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                        const Text('please rate us to know you are happy or not and to improve our services',style: TextStyle(color: Colors.white,),),
                         SizedBox(height: 25.h,),
                        TextFieldSection(),
                        SizedBox(height: 25.h,),
                        Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if(RateCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()){
                                CacheHelper.saveData(key: 'docDescRating', value: RateCubit.get(context).descriptionController.text);
                                CacheHelper.saveData(key: 'docComplianRating', value: RateCubit.get(context).complaineCostController.text);
                                CacheHelper.saveData(key: 'docSatisfyRating', value: RateCubit.get(context).satisfyingController.text);
                                CacheHelper.saveData(key: 'docRatingName', value: CacheHelper.getData(key: 'regName'));
                                CacheHelper.saveData(key: 'docRating', value: 'done');
                                showSuccessSnackBar(context: context, message: 'the report is sent successfully');
                              }
                            },
                            child: Text('Submit',style: TextStyle(color: Colors.black,fontSize: 18.sp),),
                          ),
                        ),
                      ],
                    ),
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
