import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mednet/logic/submit_information_cubit/submit_information_state.dart';
import 'package:mednet/network/local/cache_helper.dart';

import 'device_form_state.dart';

class DeviceFormCubit extends Cubit<DeviceFromStates> {
  DeviceFormCubit() : super(DeviceFromInitialState());

  static DeviceFormCubit get(context) => BlocProvider.of(context);


  TextEditingController centerNameController = TextEditingController();
  TextEditingController contactPersonNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController doctorAddressController = TextEditingController();
  TextEditingController deviceNameController = TextEditingController();

  TextEditingController availableTimeController = TextEditingController();
  TextEditingController customerDescriptionController = TextEditingController();

  TextEditingController imageController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  File? imageData;
  Future<void> getImage()async{
    final ImagePicker picker=ImagePicker();
    XFile? image =await picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      var selected=File(image.path);
      CacheHelper.saveData(key: 'deviceImage', value: image.path);
      emit(ImageState());
      imageData=selected;
      print(imageData!.path);
      print(imageData!.absolute);
      print(imageData!);
      print('yes');
    }else{
      print('No');
    }
  }
}