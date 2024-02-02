import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/engineer/report_about_device_view/cubit/report_about_device_state.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';


class ReportDeviceCubit extends Cubit<ReportDeviceStates> {
  ReportDeviceCubit() : super(ReportDeviceInitialState());

  static ReportDeviceCubit get(context) => BlocProvider.of(context);


  TextEditingController deviceNameController = TextEditingController();
  TextEditingController manufactureCompanyController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController initialCostController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}