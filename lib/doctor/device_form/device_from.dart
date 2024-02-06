import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                  padding: EdgeInsets.all(20.0.sp),
                  child: Form(
                    key: DeviceFormCubit.get(context).formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Let\'s send a description report to the service provider',style: TextStyle(color: Colors.white,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                        const Text('let the service provider know some information about the problem',style: TextStyle(color: Colors.white,),),
                        SizedBox(height: 25.h,),
                        TextFieldSection(),
                        IconButton(

                            onPressed: () {
                              DeviceFormCubit.get(context).getImage();
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            )),
                        DeviceFormCubit.get(context).imageData != null
                            ? Image(
                          image: FileImage(DeviceFormCubit.get(context).imageData!),
                          height: 100,
                          width: 100,
                        )
                            : Container(),
                        SizedBox(height: 10.h,),
                        Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15.r),
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
                                CacheHelper.saveData(key: 'doctorContactPersonName', value: DeviceFormCubit.get(context).contactPersonNameController.text);
                                CacheHelper.saveData(key: 'doctorPhoneNumber', value: DeviceFormCubit.get(context).phoneNumberController.text);
                                CacheHelper.saveData(key: 'doctorDescription', value: DeviceFormCubit.get(context).customerDescriptionController.text);
                                CacheHelper.saveData(key: 'doctorAddress', value: DeviceFormCubit.get(context).doctorAddressController.text);
                                CacheHelper.saveData(key: 'doctorRequest', value: 'done');
                                showSuccessSnackBar(context: context, message: 'the report is sent successfully');
                                print(CacheHelper.getData(key: 'doctorCenterName'));
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
            ),
          );
        },
      ),
    );
  }
}
