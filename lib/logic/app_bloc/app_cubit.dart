import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:mednet/view/map/search_screen.dart';
import '../../constants/components.dart';
import '../../widget/bottom_nav_widgtes/home_view/home_widget.dart';
import '../../widget/bottom_nav_widgtes/prayer_view/prayer_widget.dart';
import '../../widget/bottom_nav_widgtes/rating_view/rating_widget.dart';
import '../../widget/bottom_nav_widgtes/tours_widget.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int currentIndex2 = 0;
  dynamic currentValue;

  List<Widget> screens = [
    const HomeWidget(),
    const SearchScreen(fromScreen: 'fromScreen'),
    const PrayerWidget(),
    const RatingWidget(),
  ];
  Future<LocationData?> getCurrentLocation() async {
    final location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }

  void changeBot(index, context)async{
    emit(ChangeBotNavState());
    currentIndex = index;
    if (currentIndex == 2) {
      if(suggestion_save == null){
        currentLocation =
        await getCurrentLocation();
      }
    }
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
