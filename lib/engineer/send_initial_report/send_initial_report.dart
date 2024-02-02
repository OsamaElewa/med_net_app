import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/engineer/send_initial_report/cubit/send_initial_report_state.dart';
import 'package:mednet/engineer/send_initial_report/widgets/text_field_section.dart';

import '../../constants/show_snack_bar.dart';
import '../../network/local/cache_helper.dart';
import 'cubit/send_initial_report_cubit.dart';

class SendInitialReport extends StatelessWidget {
  const SendInitialReport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendInitialReportCubit(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        body: BlocBuilder<SendInitialReportCubit,SendInitialReportStates>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: SendInitialReportCubit.get(context).formKey,
                    child: Column(
                      children: [
                        const Text('Let\'s send a description report to the service provider',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                        Text('let the service provider know some information about the problem',style: TextStyle(color: Colors.white,),),
                        SizedBox(height: 25,),
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
                              if(SendInitialReportCubit.get(context)
                                  .formKey
                                  .currentState!
                                  .validate()){
                                CacheHelper.saveData(key: 'engDeviceTypeName', value: SendInitialReportCubit.get(context).deviceTypeController.text);
                                CacheHelper.saveData(key: 'problemName', value: SendInitialReportCubit.get(context).problemController.text);
                                CacheHelper.saveData(key: 'initialCost', value: SendInitialReportCubit.get(context).initialCostController.text);
                                CacheHelper.saveData(key: 'engInitialReport', value: 'done');
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
            );
          },
        ),
      ),
    );
  }
}
