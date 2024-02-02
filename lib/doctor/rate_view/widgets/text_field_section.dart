import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/doctor/rate_view/cubit/rate_cubit.dart';
import 'package:mednet/doctor/rate_view/cubit/rate_state.dart';

import '../../../../../constants/custom_text_field.dart';


class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateCubit,RateStates>(
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              textInputType: TextInputType.text,
              controller: RateCubit.get(context).descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please describe the service';
                }
                return null;
              },
              title: 'description',
              hintText: 'Enter description',
              prefixIcon: Icon(Icons.business_center_outlined,color: Colors.white,),
            ),

            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: RateCubit.get(context).complaineCostController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter any complaines';
                }
                return null;
              },
              title: 'complaines',
              hintText: 'Enter complaines',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),
            const SizedBox(height: 15,),
            CustomTextField(
              textInputType: TextInputType.text,
              controller: RateCubit.get(context).satisfyingController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter your satisfy';
                }
                return null;
              },
              title: 'satisfy',
              hintText: 'Enter your satisfy',
              prefixIcon: Icon(Icons.devices_other_outlined,color: Colors.white,),
            ),
          ],
        );
      },
    );
  }
}
