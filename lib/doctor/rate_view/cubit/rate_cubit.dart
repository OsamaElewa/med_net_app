import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mednet/doctor/rate_view/cubit/rate_state.dart';


class RateCubit extends Cubit<RateStates> {
  RateCubit() : super(RateInitialState());

  static RateCubit get(context) => BlocProvider.of(context);


  TextEditingController descriptionController = TextEditingController();
  TextEditingController complaineCostController = TextEditingController();
  TextEditingController satisfyingController = TextEditingController();

  var formKey = GlobalKey<FormState>();
}