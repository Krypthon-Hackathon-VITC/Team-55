import 'package:app/constants.dart';
import 'package:app/views/authentications/verification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  bool isLoading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: "Enter Phone Number",
            ),
          ),
          TextButton(
              onPressed: () {
                auth.verifyPhoneNumber(
                    phoneNumber: "+919557037766",
                    verificationCompleted: (_) {},
                    verificationFailed: (e) {
                      print(e);
                    },
                    codeSent: (String verification, int? token) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerificationPage(
                                    VerificationId: verification,
                                  )));
                    },
                    codeAutoRetrievalTimeout: (e) {
                      print(e);
                    });
              },
              child: Text('Sign In'))
        ],
      ),
    );
  }
}
