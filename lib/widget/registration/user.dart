import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../constants/components.dart';
import '../../constants/custom_button.dart';
import '../../constants/transitions.dart';
import '../../network/local/cache_helper.dart';
import '../../view/Registration/registe_success_screen.dart';

class UserRegistrationWidget extends StatefulWidget {
  const UserRegistrationWidget({super.key});

  @override
  State<UserRegistrationWidget> createState() => _UserRegistrationWidgetState();
}

class _UserRegistrationWidgetState extends State<UserRegistrationWidget> {
  bool Male = false;
  bool Female = false;
  bool value = false;
  var UserFormKey = GlobalKey<FormState>();

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Form(
        key: UserFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 375),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: 50.0,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: [
              Row(
                children: [
                  Expanded(
                    child: TFF(
                      validator: (v) {
                        if(_firstnameController.text.isEmpty){
                          return "";
                        }else{
                          return null;
                        }
                      },
                      controller: _firstnameController,
                      isSuffix: false,
                      action: TextInputAction.next,
                      type: TextInputType.text,
                      isPrefix: false,
                      underlineBorder: false,
                      isEnabledBorder: true,
                      borderColor: grey_border,
                      filled: true,
                      filledColor: white,
                      hint: 'First name',
                      label: 'First name',
                      labelColor: grey,
                      hintColor: grey,
                      borderRadius: 10,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TFF(
                      validator: (v) {
                        if(_lastnameController.text.isEmpty){
                          return "";
                        }else{
                          return null;
                        }
                      },
                      controller: _lastnameController,
                      isSuffix: false,
                      borderRadius: 10,
                      labelColor: grey,
                      hintColor: grey,
                      filled: true,
                      filledColor: white,
                      action: TextInputAction.next,
                      type: TextInputType.text,
                      isPrefix: false,
                      underlineBorder: false,
                      isEnabledBorder: true,
                      borderColor: grey_border,
                      hint:
                      'Last name',
                      label:
                      'Last name',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TFF(
                validator: (v) {
                  if(_emailController.text.isEmpty){
                    return "";
                  }else{
                    return null;
                  }
                },
                controller: _emailController,
                isSuffix: false,
                borderRadius: 10,
                labelColor: grey,
                hintColor: grey,
                filled: true,
                filledColor: white,
                action: TextInputAction.next,
                type: TextInputType.text,
                isPrefix: false,
                underlineBorder: false,
                isEnabledBorder: true,
                borderColor: grey_border,
                hint: 'Email address',
                label:
                'Email address',
              ),
              SizedBox(height: 20),
              Text(
                'select_gender',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: grey,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  /// category 1
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color:
                            Male ? primaryColor : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 5,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Image.asset(
                                      'assets/images/el7ag.png'),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Male
                                            ? primaryColor
                                            : grey,
                                        width: 5,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 1),
                            Text(
                              'male',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: grey_text,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          Male = true;
                          Female = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),

                  /// category 2
                  Expanded(
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Female
                                ? primaryColor
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 5,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                Expanded(
                                  flex: 10,
                                  child: Image.asset(
                                      'assets/images/el7aga.png'),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Female
                                            ? primaryColor
                                            : grey,
                                        width: 5,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 1),
                            Text(
                              'Female',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: grey_text,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          Male = false;
                          Female = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: secondaryColor,
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: screenWidth(context, .7)),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Confirm agreement',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Confirm agreement',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: grey,
                            decoration: TextDecoration.underline,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight(context, .257)),
              CustomButton(
                width: double.infinity,
                onTap: () {
                  if (Male == false && Female == false) {
                    buildSnackBar(
                      'select_gender',
                      context,
                      2,
                    );
                  }if (value == false) {
                    buildSnackBar(
                      'confirm_privacy_policy',
                      context,
                      2,
                    );
                  } if (Male == false && Female == false) {
                    buildSnackBar(
                      'select_gender',
                      context,
                      2,
                    );
                  }if (UserFormKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    CacheHelper.saveData(key: 'firstNameLocal', value: _firstnameController.text);
                    CacheHelper.saveData(key: 'lastNameLocal', value: _lastnameController.text);
                    CacheHelper.saveData(key: 'emailAddressLocal', value: _emailController.text);
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: RegisterSuccessScreen(),
                      ),
                    );
                  }else {
                    FocusScope.of(context).unfocus();
                  }
                },
                title: 'save',
                txtColor: grey,
                color: white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
