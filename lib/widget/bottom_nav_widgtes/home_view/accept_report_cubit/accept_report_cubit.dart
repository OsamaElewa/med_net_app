import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';
import 'package:mednet/widget/bottom_nav_widgtes/home_view/accept_report_cubit/accept_report_state.dart';


class AcceptReportCubit extends Cubit<AcceptReportStates> {
  AcceptReportCubit() : super(AcceptReportInitialState());

  static AcceptReportCubit get(context) => BlocProvider.of(context);


  TextEditingController maintenanceDateController = TextEditingController();
  TextEditingController maintenanceTimeController = TextEditingController();
  TextEditingController maintenancePlaceController = TextEditingController();

  var formKey = GlobalKey<FormState>();
}