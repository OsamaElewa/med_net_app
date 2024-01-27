// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as p;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/register_cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool securePassword = true;

  void changePasswordVisibility() {
    securePassword = !securePassword;
    emit(RegisterChangePasswordVisibilityState());
  }
}
