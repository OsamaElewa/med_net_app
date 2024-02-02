import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/cubit/send_final_report_to_doctor_cubit.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/cubit/send_final_report_to_doctor_state.dart';

import '../../../../../constants/custom_text_field.dart';


class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendFinalReportToDoctorCubit,SendFinalReportToDoctorStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendFinalReportToDoctorCubit.get(context).compUpdatesController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter updates';
                }
                return null;
              },
              title: 'updates',
              hintText: 'Enter updates',
              prefixIcon: Icon(Icons.business_center_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendFinalReportToDoctorCubit.get(context).compFinalCostController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter final cost';
                }
                return null;
              },
              title: 'Final cost',
              hintText: 'Enter final cost',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendFinalReportToDoctorCubit.get(context).compPhoneNumberController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter phone number';
                }
                return null;
              },
              title: 'Phone number',
              hintText: 'Enter Phone number',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),
          ],
        );
      },
    );
  }
}
