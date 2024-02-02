abstract class EngineerStates {}

class EngineerInitialState extends EngineerStates {}

class ChangeBotNavState extends EngineerStates {}

class ChangeCheckOutButtonValueState extends EngineerStates {}

class ChangeAppLocaleState extends EngineerStates {}

class ToggelLangState extends EngineerStates {}

class ToggelLostFoundState extends EngineerStates {}

class AppBottomBarVisibilityChanged extends EngineerStates {
  final bool test;

  AppBottomBarVisibilityChanged(this.test);
}