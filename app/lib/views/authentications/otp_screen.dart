// ignore_for_file: use_build_context_synchronously

import 'package:app/views/homepage/homepage.dart';
import 'package:app/views/mainmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, required this.phoneno, required this.VerificationId});
  String phoneno;
  String VerificationId;
  bool isLoading = false;
  final otpNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = new TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Row(
          children: const [
            Icon(
              PhosphorIcons.caretLeft,
              size: 26.0,
              color: Colors.black,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("OTP Verification",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: const Color.fromARGB(255, 2, 2, 2))),
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 25.w, right: 10.w),
            child: Text("We have sent a verification code to",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    color: const Color.fromARGB(255, 0, 0, 0))),
          ),
          Text(
            "+91 XXXXX-" +
                phoneno.substring(phoneno.length - 4, phoneno.length),
            style: GoogleFonts.poppins(fontSize: 14.sp),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 46.0),
              child: PinCodeTextField(
                pinBoxOuterPadding: EdgeInsets.only(right: 18.w),
                controller: _controller,
                onDone: (text) async {
                  final credential = PhoneAuthProvider.credential(
                    verificationId: VerificationId,
                    smsCode: text,
                  );
                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => ScreenUtilInit(
                              designSize: const Size(390, 844),
                              minTextAdapt: true,
                              splitScreenMode: true,
                              builder: (BuildContext context, Widget? child) {
                                return const MaterialApp(
                                  debugShowCheckedModeBanner: false,
                                  home: MainMenu(),
                                );
                              },
                            )),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
                maxLength: 6,
                pinBoxWidth: 46,
                pinBoxHeight: 51,
                pinBoxRadius: 8,
                pinBoxBorderWidth: 1.5,
                defaultBorderColor: const Color(0xFFB6B6B6),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 26.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: 163.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffB6B6B6)),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(11)),
                    child: TextButton(
                        onPressed: () {},
                        child: Text("Resend SMS in 16s",
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: const Color(0xffC8C8C8))))),
                Container(
                    width: 163.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffB6B6B6)),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(11)),
                    child: TextButton(
                        onPressed: () {},
                        child: Text("Call me in 16s",
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: const Color(0XFFC8C8C8))))),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
