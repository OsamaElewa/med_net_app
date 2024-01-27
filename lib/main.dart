import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:intl/intl.dart';
import 'package:mednet/logic/app_bloc/app_cubit.dart';
import 'package:mednet/splash_screen/splash_screen.dart';
import 'constants/components.dart';
import 'constants/colors.dart';
import 'logic/login_bloc/auth_cubit.dart';
import 'logic/registration_bloc/registration_cubit.dart';
import 'network/local/bloc_observer.dart';
import 'network/local/cache_helper.dart';
import 'network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  // Widget? startWidget;
  // Load the saved locale or use the default
  runApp(
    MyApp(
      startWidget: SplashScreen(isAuthenticated: CacheHelper.getData(key: 'authenticated') ?? false,),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? startWidget;

  const MyApp({super.key, this.startWidget});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  // late Locale _appLocale;

  @override
  void initState() {
    super.initState();
    FlutterStatusbarcolor.setStatusBarColor(primaryColor);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => RegistrationCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
          startWidget: SplashScreen(isAuthenticated: CacheHelper.getData(key: 'authenticated') ?? false,),
          // startWidget: RegistrationScreen(),
          // startWidget: SendPhoneScreen(),
          isAuthenticated: CacheHelper.getData(key: 'authenticated') ?? false,
        ),
      ),
    );
  }
}
