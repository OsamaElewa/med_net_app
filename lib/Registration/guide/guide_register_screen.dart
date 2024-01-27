import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import '../../../constants/colors.dart';
import '../../../constants/components.dart';
import '../../../constants/transitions.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../constants/custom_button.dart';
import '../../view/Registration/registe_success_screen.dart';

class GuideRegisterScreen extends StatefulWidget {
  const GuideRegisterScreen({super.key});

  @override
  State<GuideRegisterScreen> createState() => _GuideRegisterScreenState();
}

class _GuideRegisterScreenState extends State<GuideRegisterScreen> {
  bool Male = false;
  bool Female = false;
  bool value = false;
  dynamic _selectedDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backGroundColor,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                'assets/images/bc.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            SingleChildScrollView(
              child: AnimationLimiter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
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
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                              ),
                            ),
                            // SizedBox(width: 10),
                            Text(
                              'registration',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: grey,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'Fill information',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: grey,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Date of birth',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: grey,
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                height: 250,
                                child: ScrollDatePicker(
                                  selectedDate: _selectedDate,
                                  locale: const Locale('en'),
                                  onDateTimeChanged: (DateTime value) {
                                    setState(() {
                                      _selectedDate = value;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => SizedBox(
                                  height: 250,
                                  child: ScrollDatePicker(
                                    selectedDate: _selectedDate,
                                    locale: const Locale('en'),
                                    onDateTimeChanged: (DateTime value) {
                                      setState(() {
                                        _selectedDate = value;
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: grey_border),
                                color: white,
                              ),
                              // height: 10,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                                child: Text(_selectedDate.toString().substring(0, 10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TFF(
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
                          hint: 'About me',
                          label: 'About me',
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            buildCameraDialog1(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(color: grey_border),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: screenHeight(context, .2),
                            width: double.infinity,
                            child: IDImage1 == null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Image.asset('assets/images/image.png'),
                                      const Icon(
                                        Icons.image_outlined,
                                        color: Color.fromRGBO(59, 135, 179, 1),
                                        size: 60,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Passport photo',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: grey_text,
                                        ),
                                      ),
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      IDImage1!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Upload photo',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: grey_text,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TFF(
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
                          hint: 'Education',
                          label: 'Education',
                        ),
                        const SizedBox(height: 20),
                        TFF(
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
                          hint: 'Experience',
                          label: 'Experience',
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            buildCameraDialog2(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: white,
                              border: Border.all(color: grey_border),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: screenHeight(context, .2),
                            width: double.infinity,
                            child: IDImage2 == null
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // Image.asset('assets/images/image.png'),
                                      const Icon(
                                        Icons.image_outlined,
                                        color: Color.fromRGBO(59, 135, 179, 1),
                                        size: 60,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Certificates and diplomas',
                                        style: GoogleFonts.inter(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: grey_text,
                                        ),
                                      ),
                                    ],
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      IDImage2!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Upload photo',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: grey_text,
                          ),
                        ),
                        const SizedBox(height: 20),
                        TFF(
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
                          hint: 'how many times umrah',
                          label: 'how many times umrah',
                        ),
                        const SizedBox(height: 20),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'confirm_agreement1',
                                    style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: grey,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'confirm_agreement2',
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
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 10,
              right: 10,
              child: CustomButton(
                width: double.infinity,
                onTap: () {
                  Navigator.push(
                    context,
                    CustomPageRoute(
                      child: RegisterSuccessScreen(),
                    ),
                  );
                },
                title: 'Continue',
                txtColor: white,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  File? IDImage1;

  Future pickImage1(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imageTemporary = await saveImage1(image.path);
      setState(() {
        IDImage1 = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImage1(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  void buildCameraDialog1(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Lottie.asset('assets/lotties/image.json'),
        backgroundColor: Colors.black26,
        actions: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      pickImage1(ImageSource.camera);
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Camera',
                    style: mainTextStyle(context,color: white),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      pickImage1(ImageSource.gallery);
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Gallery',
                    style: mainTextStyle(context,color: white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future pickImage2(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imageTemporary = await saveImage2(image.path);
      setState(() {
        IDImage2 = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  File? IDImage2;

  Future<File> saveImage2(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  void buildCameraDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Lottie.asset('assets/lotties/image.json'),
        backgroundColor: Colors.black26,
        actions: [
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      pickImage2(ImageSource.camera);
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Camera',
                    style: mainTextStyle(context,color: white),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      pickImage2(ImageSource.gallery);
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Gallery',
                    style: mainTextStyle(context,color: white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
