import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/doctor/applied_view/applied_view.dart';
import 'package:mednet/doctor/bills_view/bills_view.dart';
import 'package:mednet/doctor/device_form/device_from.dart';
import 'package:mednet/doctor/profile_view/profile_view.dart';
import 'package:mednet/doctor/send_report/send_report.dart';

import '../../../constants/components.dart';
import 'doctor_state.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorInitialState());

  static DoctorCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int currentIndex2 = 0;
  dynamic currentValue;

  List<Widget> screens = [
    const SendReport(),
    const AppliedView(),
    const BillsView(),
    const ProfileView(),
  ];

  void changeBot(index, context) async {
    emit(ChangeBotNavState());
    currentIndex = index;
  }

  dynamic changeAppLocale(value) {
    emit(ChangeAppLocaleState());
    appLocale = Locale(value);
  }

  bool _isBottomBarVisible = true;

  bool get isBottomBarVisible => _isBottomBarVisible;

  void toggleBottomBarVisibility() {
    _isBottomBarVisible = !_isBottomBarVisible;
    emit(AppBottomBarVisibilityChanged(_isBottomBarVisible));
  }
}
