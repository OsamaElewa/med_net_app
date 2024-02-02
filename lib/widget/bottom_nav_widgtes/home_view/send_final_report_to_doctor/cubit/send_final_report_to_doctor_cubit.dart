import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report_cubit/accept_report_state.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/send_final_report_to_doctor/cubit/send_final_report_to_doctor_state.dart';


class SendFinalReportToDoctorCubit extends Cubit<SendFinalReportToDoctorStates> {
  SendFinalReportToDoctorCubit() : super(SendFinalReportToDoctorInitialState());

  static SendFinalReportToDoctorCubit get(context) => BlocProvider.of(context);


  TextEditingController compUpdatesController = TextEditingController();
  TextEditingController compFinalCostController = TextEditingController();
  TextEditingController compPhoneNumberController = TextEditingController();

  var formKey = GlobalKey<FormState>();
}