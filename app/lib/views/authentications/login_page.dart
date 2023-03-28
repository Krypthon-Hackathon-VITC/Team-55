import 'dart:math';

import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:app/views/authentications/otp_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var h1 = 250.h;
var h2 = 10.h;
var w1 = 390.w;
var t1 = 26.sp;

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controller = new TextEditingController();
  bool isLoading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/pic1.png",
                      height: h1,
                      width: w1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h2),
                      child: Text(
                        "Get the care you need,\nwhen you need it.",
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                            fontSize: t1, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  h1 = 250.h;
                  h2 = 10.h;
                  w1 = 390.w;
                  t1 = 26.sp;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Text(
                      "Login or Sign up",
                      style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF999999)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0.w, top: 10.h),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFC8C8C8)),
                        borderRadius: BorderRadius.circular(20)),
                    child: CountryCodePicker(
                      onChanged: print,
                      initialSelection: 'IN',
                      showCountryOnly: true,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 12.0.w, top: 10.h, right: 12.w),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    width: 220.w,
                    height: 45.h,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          h1 = 215.h;
                          w1 = 230.w;
                          t1 = 20.sp;
                          h2 = 2.h;
                        });
                      },
                      controller: _controller,
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: "Enter phone number",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Container(
                  width: 326.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                      color: Color(0xff3B63DA),
                      borderRadius: BorderRadius.circular(11)),
                  child: TextButton(
                      onPressed: () {
                        auth.verifyPhoneNumber(
                            phoneNumber: "+91${_controller.text.toString()}",
                            verificationCompleted: (_) {},
                            verificationFailed: (e) {
                              print(e);
                            },
                            codeSent: (String verification, int? token) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen(
                                            VerificationId: verification,
                                            phoneno: verification,
                                          )));
                            },
                            codeAutoRetrievalTimeout: (e) {
                              print(e);
                            });
                      },
                      child: Text("Continue",
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, color: Colors.white)))),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Text(
                "or",
                style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF999999)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 46.sp,
                      height: 46.sp,
                      child: Image.asset("assets/images/pic2.png"),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFC8C8C8)),
                          borderRadius: BorderRadius.circular(20))),
                  Container(
                      width: 46.sp,
                      height: 46.sp,
                      child: Image.asset("assets/images/pic3.png"),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFC8C8C8)),
                          borderRadius: BorderRadius.circular(20))),
                  Container(
                      width: 46.sp,
                      height: 46.sp,
                      // ignore: sort_child_properties_last
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 6.sp,
                          ),
                          Icon(
                            Icons.circle,
                            size: 6.sp,
                          ),
                          Icon(
                            Icons.circle,
                            size: 6.sp,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFC8C8C8)),
                          borderRadius: BorderRadius.circular(20)))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    "By continuing, you agree to our",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF999999)),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    "Terms of service Privacy Policy Content Policy",
                    style: GoogleFonts.poppins(
                        decoration: TextDecoration.underline,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF999999)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
