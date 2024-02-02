import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/doctor/device_form/cubit/device_form_cubit.dart';
import 'package:mednet/doctor/device_form/cubit/device_form_state.dart';
import 'package:mednet/engineer/report_about_device_view/cubit/report_about_device_cubit.dart';
import 'package:mednet/engineer/report_about_device_view/cubit/report_about_device_state.dart';


import '../../../constants/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  TextFieldSection({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportDeviceCubit,ReportDeviceStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: ReportDeviceCubit.get(context).deviceNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the device name';
                }
                return null;
              },
              title: 'Device name',
              hintText: 'Enter the device name',
              prefixIcon: const Icon(Icons.business_center_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: ReportDeviceCubit.get(context).modelNumberController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the model number';
                }
                return null;
              },
              title: 'Model number',
              hintText: 'Enter the model number',
              prefixIcon: const Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: ReportDeviceCubit.get(context).manufactureCompanyController,
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
              controller: ReportDeviceCubit.get(context).problemController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the problem';
                }
                return null;
              },
              title: 'Problem',
              hintText: 'Enter the problem',
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: ReportDeviceCubit.get(context).initialCostController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the initial cost';
                }
                return null;
              },
              title: 'Initial cost',
              hintText: 'Enter the initial cost',
            ),
          ],
        );
      },
    );
  }
}
