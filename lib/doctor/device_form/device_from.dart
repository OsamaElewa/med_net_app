import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/doctor/device_form/cubit/device_form_cubit.dart';
import 'package:mednet/doctor/device_form/cubit/device_form_state.dart';
import 'package:mednet/doctor/device_form/text_field_section.dart';

import '../../constants/show_snack_bar.dart';
import '../../network/local/cache_helper.dart';

class DeviceForm extends StatelessWidget {
  const DeviceForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeviceFormCubit(),
      child: BlocBuilder<DeviceFormCubit,DeviceFromStates>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: DeviceFormCubit.get(context).formKey,
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
                              if(DeviceFormCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()){
                                CacheHelper.saveData(key: 'doctorCenterName', value: DeviceFormCubit.get(context).centerNameController.text);
                                CacheHelper.saveData(key: 'doctorDeviceName', value: DeviceFormCubit.get(context).deviceNameController.text);
                                CacheHelper.saveData(key: 'doctorManufactureCompany', value: DeviceFormCubit.get(context).manufactureCompanyController.text);
                                CacheHelper.saveData(key: 'doctorModelNumber', value: DeviceFormCubit.get(context).modelNumberController.text);
                                CacheHelper.saveData(key: 'doctorRequest', value: 'done');
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
            ),
          );
        },
      ),
    );
  }
}
