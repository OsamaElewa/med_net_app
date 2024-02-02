import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report_cubit/accept_report_cubit.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report_cubit/accept_report_state.dart';


import '../../../../constants/custom_text_field.dart';

class TextFieldSection extends StatelessWidget {
  TextFieldSection({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcceptReportCubit,AcceptReportStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: AcceptReportCubit.get(context).maintenancePlaceController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter maintenancePlace';
                }
                return null;
              },
              title: 'maintenancePlace',
              hintText: 'Enter maintenancePlace',
              prefixIcon: Icon(Icons.business_center_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: AcceptReportCubit.get(context).maintenanceDateController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter maintenanceDate';
                }
                return null;
              },
              title: 'maintenanceDate',
              hintText: 'Enter maintenanceDate',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: AcceptReportCubit.get(context).maintenanceTimeController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter maintenanceTime';
                }
                return null;
              },
              title: 'maintenanceTime',
              hintText: 'Enter the maintenanceTime',
            ),
          ],
        );
      },
    );
  }
}
