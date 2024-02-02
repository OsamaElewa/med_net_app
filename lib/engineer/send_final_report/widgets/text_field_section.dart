import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../constants/custom_text_field.dart';
import '../cubit/send_final_report_cubit.dart';
import '../cubit/send_final_report_state.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendFinalReportCubit,SendFinalReportStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendFinalReportCubit.get(context).updatesController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the updates';
                }
                return null;
              },
              title: 'Updates',
              hintText: 'Enter the updates',
              prefixIcon: Icon(Icons.business_center_outlined,color: Colors.white,),
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: SendFinalReportCubit.get(context).finalCostController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the final cost';
                }
                return null;
              },
              title: 'Final cost',
              hintText: 'Enter the final cost',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),
          ],
        );
      },
    );
  }
}
