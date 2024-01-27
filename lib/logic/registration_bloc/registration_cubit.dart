import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'registration_states.dart';

class RegistrationCubit extends Cubit<RegistrationStates> {
  RegistrationCubit() : super(RegistrationInitialState());

  static RegistrationCubit get(context) => BlocProvider.of(context);

  bool isUser = false;

  dynamic toggelUserType(value) {
    isUser = value;
    emit(ToggelUserTypeState());
  }

}
