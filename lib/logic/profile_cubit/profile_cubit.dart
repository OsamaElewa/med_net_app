// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as p;

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/profile_cubit/profile_state.dart';
import 'package:mednet/logic/register_cubit/register_state.dart';
import 'package:mednet/network/local/cache_helper.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}
