import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/engineer/send_final_report/cubit/send_final_report_state.dart';

class SendFinalReportCubit extends Cubit<SendFinalReportStates> {
  SendFinalReportCubit() : super(SendFinalReportInitialState());

  static SendFinalReportCubit get(context) => BlocProvider.of(context);

  TextEditingController updatesController = TextEditingController();
  TextEditingController finalCostController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}