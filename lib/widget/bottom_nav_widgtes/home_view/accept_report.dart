import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report_cubit/accept_report_cubit.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report_cubit/accept_report_state.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/widgets/text_field_section.dart';

import '../../../constants/show_snack_bar.dart';
import '../../../network/local/cache_helper.dart';

class AcceptReport extends StatelessWidget {
  const AcceptReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcceptReportCubit(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        body: BlocBuilder<AcceptReportCubit,AcceptReportStates>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: AcceptReportCubit.get(context).formKey,
                    child: Column(
                      children: [
                        const Text('Let\'s send a description report to the service provider',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                        const Text('let the service provider know some information about the problem',style: TextStyle(color: Colors.white,),),
                        const SizedBox(height: 25,),
                        TextFieldSection(),
                        const SizedBox(height: 25,),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {
                              if(AcceptReportCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()){
                                CacheHelper.saveData(key: 'maintenancePlace', value: AcceptReportCubit.get(context).maintenancePlaceController.text);
                                CacheHelper.saveData(key: 'maintenanceTimeName', value: AcceptReportCubit.get(context).maintenanceTimeController.text);
                                CacheHelper.saveData(key: 'maintenanceDate', value: AcceptReportCubit.get(context).maintenanceDateController.text);
                                CacheHelper.saveData(key: 'acceptRequest', value: 'done');
                                showSuccessSnackBar(context: context, message: 'the report is sent successfully');
                              }
                            },
                            child: const Text('Submit',style: TextStyle(color: Colors.black,fontSize: 18),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ) ;
          },
        ),
      ),
    );
  }
}
