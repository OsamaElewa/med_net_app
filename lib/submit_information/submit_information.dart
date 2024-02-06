import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mednet/constants/show_snack_bar.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_cubit.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';
import 'package:mednet/network/local/cache_helper.dart';
import 'package:mednet/submit_information/widgets/text_field_section.dart';
import 'package:mednet/view/bottom_nav/bottom_nav_screen.dart';

class SubmitInformation extends StatelessWidget {
  const SubmitInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SubmitInformationCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        body: BlocBuilder<SubmitInformationCubit,SubmitInformationStates>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Form(
                    key: SubmitInformationCubit.get(context).formKey,
                    child: Column(
                      children: [
                        Text('Let\'s send a description report to the service provider',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                        Text('let the service provider know some information about the problem',style: TextStyle(color: Colors.white,),),
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
                              if(SubmitInformationCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()){
                                CacheHelper.saveData(key: 'compCenterName', value: SubmitInformationCubit.get(context).centerNameController.text);
                                CacheHelper.saveData(key: 'compDeviceName', value: SubmitInformationCubit.get(context).deviceNameController.text);
                                CacheHelper.saveData(key: 'compDescriptionCompany', value: SubmitInformationCubit.get(context).doctorDescriptionController.text);
                                CacheHelper.saveData(key: 'compCenterAddress', value: SubmitInformationCubit.get(context).centerAddressController.text);
                                CacheHelper.saveData(key: 'reportToEng', value: 'done');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AppLayout(),));
                                showSuccessSnackBar(context: context, message: 'the report is sent successfully');
                                print(CacheHelper.getData(key: 'centerName'));
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
