abstract class AppStates {}

class AppInitialState extends AppStates {}

class ChangeBotNavState extends AppStates {}

class ChangeCheckOutButtonValueState extends AppStates {}

class ChangeAppLocaleState extends AppStates {}

class ToggelLangState extends AppStates {}

class ToggelLostFoundState extends AppStates {}

class AppBottomBarVisibilityChanged extends AppStates {
  final bool test;

  AppBottomBarVisibilityChanged(this.test);
}