import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';

import 'device_form_state.dart';

class DeviceFormCubit extends Cubit<DeviceFromStates> {
  DeviceFormCubit() : super(DeviceFromInitialState());

  static DeviceFormCubit get(context) => BlocProvider.of(context);


  TextEditingController centerNameController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();
  TextEditingController manufactureCompanyController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}