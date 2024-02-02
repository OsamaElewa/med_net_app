import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/doctor/device_form/cubit/device_form_cubit.dart';
import 'package:mednet/doctor/device_form/cubit/device_form_state.dart';


import '../../constants/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  TextFieldSection({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceFormCubit,DeviceFromStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).centerNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your center name';
                }
                return null;
              },
              title: 'Center name',
              hintText: 'Enter your center name',
              prefixIcon: Icon(Icons.business_center_outlined,color: Colors.white,),
            ),
            
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).deviceNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your device name';
                }
                return null;
              },
              title: 'Device name',
              hintText: 'Enter your device name',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).manufactureCompanyController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter manufacture company';
                }
                return null;
              },
              title: 'manufacture company',
              hintText: 'Enter the manufacture company',
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).modelNumberController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter model number';
                }
                return null;
              },
              title: 'model number',
              hintText: 'Enter the model number',
            ),
          ],
        );
      },
    );
  }
}
