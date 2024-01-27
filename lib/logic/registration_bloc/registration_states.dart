abstract class RegistrationStates {}

class ToggelUserTypeState extends RegistrationStates {}

class RegistrationInitialState extends RegistrationStates {}

class RegistrationLoadingState extends RegistrationStates {}

class RegistrationErrorState extends RegistrationStates {
  final String error;

  RegistrationErrorState(this.error);
}