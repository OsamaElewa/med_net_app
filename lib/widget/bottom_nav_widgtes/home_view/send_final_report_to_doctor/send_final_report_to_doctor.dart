import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/cubit/send_final_report_to_doctor_cubit.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/cubit/send_final_report_to_doctor_state.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/widgets/text_field_section.dart';

import '../../../../constants/show_snack_bar.dart';
import '../../../../network/local/cache_helper.dart';

class SendFinalReportToDoctor extends StatelessWidget {
  const SendFinalReportToDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendFinalReportToDoctorCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        body: BlocBuilder<SendFinalReportToDoctorCubit,SendFinalReportToDoctorStates>(
          builder: (context, state) {
            return CacheHelper.getData(key: 'engFinalReport') != null? SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Form(
                    key: SendFinalReportToDoctorCubit.get(context).formKey,
                    child: Column(
                      children: [
                        Text('Let\'s send the final report to the doctor',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                        const Text('let the doctor receive the final report to finish the process',style: TextStyle(color: Colors.white,),),
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
                              if(SendFinalReportToDoctorCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()){
                                CacheHelper.saveData(key: 'compUpdates', value: SendFinalReportToDoctorCubit.get(context).compUpdatesController.text);
                                CacheHelper.saveData(key: 'compFinalCost', value: SendFinalReportToDoctorCubit.get(context).compFinalCostController.text);
                                CacheHelper.saveData(key: 'compPhoneNumber', value: SendFinalReportToDoctorCubit.get(context).compPhoneNumberController.text);
                                CacheHelper.saveData(key: 'compSendFinalReport', value: 'done');
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
            ) :
                Center(
                  child: Text('when the engineer send the final report you can send it to the doctor',style: TextStyle(color: Colors.white),),
                )
            ;
          },
        ) ,
      ),
    );
  }
}
