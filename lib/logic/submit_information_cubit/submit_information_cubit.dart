import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';

class SubmitInformationCubit extends Cubit<SubmitInformationStates> {
  SubmitInformationCubit() : super(SubmitInformationInitialState());

  static SubmitInformationCubit get(context) => BlocProvider.of(context);


  TextEditingController centerNameController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();
  TextEditingController manufactureCompanyController = TextEditingController();
  TextEditingController modelNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();
}