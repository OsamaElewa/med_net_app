import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/engineer/report_about_device_view/cubit/report_about_device_cubit.dart';
import 'package:mednet/engineer/report_about_device_view/cubit/report_about_device_state.dart';
import 'package:mednet/engineer/report_about_device_view/widgets/text_field_section.dart';

import '../../constants/show_snack_bar.dart';
import '../../network/local/cache_helper.dart';

class ReportAboutDeviceView extends StatelessWidget {
  const ReportAboutDeviceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportDeviceCubit(),
      child: BlocBuilder<ReportDeviceCubit,ReportDeviceStates>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: ReportDeviceCubit.get(context).formKey,
                  child: Column(
                    children: [
                      const Text('Let\'s send a description report to the service provider',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                      const Text('let the service provider know some information about the problem',style: TextStyle(color: Colors.white,),),
                      const SizedBox(height: 25,),
                      TextFieldSection(),
                      const SizedBox(height: 25,),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          // centerNameController
                          // deviceNameController
                          // manufactureCompanyController
                          // modelNumberController
                          onPressed: () {
                            if(ReportDeviceCubit.get(context)
                                .formKey
                                .currentState!
                                .validate()){
                              CacheHelper.saveData(key: 'doctorCenterName', value: ReportDeviceCubit.get(context).problemController.text);
                              CacheHelper.saveData(key: 'doctorDeviceName', value: ReportDeviceCubit.get(context).deviceNameController.text);
                              CacheHelper.saveData(key: 'doctorManufactureCompany', value: ReportDeviceCubit.get(context).manufactureCompanyController.text);
                              CacheHelper.saveData(key: 'doctorModelNumber', value: ReportDeviceCubit.get(context).modelNumberController.text);
                              CacheHelper.saveData(key: 'doctorModelNumber', value: ReportDeviceCubit.get(context).initialCostController.text);
                              showSuccessSnackBar(context: context, message: 'the report is sent successfully');
                              print(CacheHelper.getData(key: 'doctorCenterName'));
                            }
                          },
                          child: const Text('Submit',style: TextStyle(color: Colors.black,fontSize: 18),),
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
    );
  }
}
