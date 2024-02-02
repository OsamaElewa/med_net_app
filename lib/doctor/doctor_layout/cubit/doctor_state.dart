abstract class DoctorStates {}

class DoctorInitialState extends DoctorStates {}

class ChangeBotNavState extends DoctorStates {}

class ChangeCheckOutButtonValueState extends DoctorStates {}

class ChangeAppLocaleState extends DoctorStates {}

class ToggelLangState extends DoctorStates {}

class ToggelLostFoundState extends DoctorStates {}

class AppBottomBarVisibilityChanged extends DoctorStates {
  final bool test;

  AppBottomBarVisibilityChanged(this.test);
}