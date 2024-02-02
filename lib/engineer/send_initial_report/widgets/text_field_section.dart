import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/engineer/send_initial_report/cubit/send_initial_report_cubit.dart';
import 'package:mednet/engineer/send_initial_report/cubit/send_initial_report_state.dart';

import '../../../constants/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendInitialReportCubit,SendInitialReportStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendInitialReportCubit.get(context).deviceTypeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter device type';
                }
                return null;
              },
              title: 'Device type',
              hintText: 'Enter your Device type',
              prefixIcon: Icon(Icons.business_center_outlined,color: Colors.white,),
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendInitialReportCubit.get(context).problemController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the problem';
                }
                return null;
              },
              title: 'Problem',
              hintText: 'Enter the problem',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendInitialReportCubit.get(context).initialCostController,
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
