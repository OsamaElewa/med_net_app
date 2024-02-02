import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/engineer/send_initial_report/cubit/send_initial_report_state.dart';

class SendInitialReportCubit extends Cubit<SendInitialReportStates> {
  SendInitialReportCubit() : super(SendInitialReportInitialState());

  static SendInitialReportCubit get(context) => BlocProvider.of(context);


  TextEditingController deviceTypeController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController initialCostController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}