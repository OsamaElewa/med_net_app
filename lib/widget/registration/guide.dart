import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Registration/guide/guide_register_screen.dart';
import '../../constants/colors.dart';
import '../../constants/components.dart';
import '../../constants/custom_button.dart';
import '../../constants/transitions.dart';
import '../../network/local/cache_helper.dart';

class GuideRegistrationWidget extends StatefulWidget {
  const GuideRegistrationWidget({super.key});

  @override
  State<GuideRegistrationWidget> createState() =>
      _GuideRegistrationWidgetState();
}

class _GuideRegistrationWidgetState extends State<GuideRegistrationWidget> {
  bool _Male = false;
  bool _Female = false;
  bool _value = false;
  var GuideFormKey = GlobalKey<FormState>();

  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child:  Form(
        key: GuideFormKey,
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
                      hint: 'first_name',
                      label: 'first_name',
                      labelColor: grey,
                      hintColor: grey,
                      borderRadius: 10,
                    ),
                  ),
                  const SizedBox(width: 10),
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
                      hint: 'last_name',
                      label: 'last_name',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
                hint: 'email_address',
                label: 'email_address',
              ),
              const SizedBox(height: 20),
              Text(
                'select_gender',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: grey,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  /// category 1
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: _Male ? primaryColor : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 23),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/el7ag.png'),
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
                          Positioned(
                            bottom: 0,
                            right: 1,
                            left: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _Male ? primaryColor : grey,
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
                      onTap: () {
                        setState(() {
                          _Male = true;
                          _Female = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  /// category 2
                  Expanded(
                    flex: 5,
                    child: InkWell(
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 9),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: _Female ? primaryColor : Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(
                                12,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 23),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/el7aga.png'),
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
                          Positioned(
                            bottom: 0,
                            right: 1,
                            left: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: _Female ? primaryColor : grey,
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
                      onTap: () {
                        setState(() {
                          _Female = true;
                          _Male = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight(context, .33)),
              CustomButton(
                width: double.infinity,
                onTap: () {
                  if (_Male == false && _Female == false) {
                    buildSnackBar(
                      'select_gender',
                      context,
                      2,
                    );
                  } if (_Male == false && _Female == false) {
                    buildSnackBar(
                      'select_gender',
                      context,
                      2,
                    );
                  }if (GuideFormKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    CacheHelper.saveData(key: 'firstNameLocal', value: _firstnameController.text);
                    CacheHelper.saveData(key: 'lastNameLocal', value: _lastnameController.text);
                    CacheHelper.saveData(key: 'emailAddressLocal', value: _emailController.text);
                    Navigator.push(
                      context,
                      CustomPageRoute(
                        child: const GuideRegisterScreen(),
                      ),
                    );
                  }else {
                    FocusScope.of(context).unfocus();
                  }
                },
                title: 'Continue',
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
