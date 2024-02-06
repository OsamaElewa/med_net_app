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
                  return 'Please enter health care / organization name';
                }
                return null;
              },
              title: 'Health care Name',
              hintText: 'Enter the health care / organization name',
              prefixIcon: Icon(Icons.business_center_outlined,color: Colors.white,),
            ),
            
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).contactPersonNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter contact person name';
                }
                return null;
              },
              title: 'Contact person name',
              hintText: 'Enter contact person name',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.phone,
              controller: DeviceFormCubit.get(context).phoneNumberController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter phone number';
                }
                return null;
              },
              title: 'Phone Number',
              hintText: 'Enter the phone number',
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).doctorAddressController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the address';
                }
                return null;
              },
              title: 'Health care address',
              hintText: 'Enter the address',
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).deviceNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the device name';
                }
                return null;
              },
              title: 'Device name',
              hintText: 'Enter the device name',
            ),
            const SizedBox(height: 15,),

            CustomTextField(
              textInputType: TextInputType.text,
              controller: DeviceFormCubit.get(context).customerDescriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your description';
                }
                return null;
              },
              title: 'Description',
              hintText: 'Enter your description',
              maxLines: 5,
            ),

          ],
        );
      },
    );
  }
}
