import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/engineer/profile_view/profile_view.dart';
import 'package:mednet/engineer/final_report_view/final_report_view.dart';
import 'package:mednet/engineer/requests_view/requests_view.dart';

import '../../../constants/components.dart';
import '../../report_about_device_view/report_about_device_view.dart';
import 'engineer_state.dart';


class EngineerCubit extends Cubit<EngineerStates> {
  EngineerCubit() : super(EngineerInitialState());

  static EngineerCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int currentIndex2 = 0;
  dynamic currentValue;

  List<Widget> screens = [
    const RequestsView(),
    //const ReportAboutDeviceView(),
    //const FinalReportView(),
    const ProfileView(),
  ];

  void changeBot(index, context)async{
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
