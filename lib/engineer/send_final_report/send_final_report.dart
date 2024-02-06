import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/engineer/send_final_report/widgets/text_field_section.dart';

import '../../constants/show_snack_bar.dart';
import '../../network/local/cache_helper.dart';
import 'cubit/send_final_report_cubit.dart';
import 'cubit/send_final_report_state.dart';

class SendFinalReport extends StatelessWidget {
  const SendFinalReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendFinalReportCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        body: BlocBuilder<SendFinalReportCubit,SendFinalReportStates>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Form(
                    key: SendFinalReportCubit.get(context).formKey,
                    child: Column(
                      children: [
                        Text('Let\'s send the final report to the company',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                        Text('let the company receive the final report to finish the process',style: TextStyle(color: Colors.white,),),
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
                              if(SendFinalReportCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()){
                                CacheHelper.saveData(key: 'engUpdates', value: SendFinalReportCubit.get(context).updatesController.text);
                                CacheHelper.saveData(key: 'engFinalCost', value: SendFinalReportCubit.get(context).finalCostController.text);
                                CacheHelper.saveData(key: 'engFinalReport', value: 'done');
                                showSuccessSnackBar(context: context, message: 'the report is sent successfully');
                              }
                            },
                            child: Text('Submit',style: TextStyle(color: Colors.grey,fontSize: 18.sp),),
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
