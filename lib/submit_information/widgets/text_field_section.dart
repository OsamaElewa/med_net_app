import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_cubit.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';

import '../../constants/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  TextFieldSection({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmitInformationCubit,SubmitInformationStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SubmitInformationCubit.get(context).centerNameController,
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
              controller: SubmitInformationCubit.get(context).deviceNameController,
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
              controller: SubmitInformationCubit.get(context).centerAddressController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter center address';
                }
                return null;
              },
              title: 'Center address',
              hintText: 'Enter the center address',
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SubmitInformationCubit.get(context).doctorDescriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the description';
                }
                return null;
              },
              title: 'Description',
              hintText: 'Enter the Description',
              maxLines: 5,
            ),
          ],
        );
      },
    );
  }
}
