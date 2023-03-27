import 'package:app/constants.dart';
import 'package:app/views/homescreen/homescreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({super.key, required this.VerificationId});
  String VerificationId;
  bool isLoading = false;
  final otpNumberController = TextEditingController();
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
              hintText: "6 digit code",
            ),
          ),
          TextButton(
            onPressed: () async {
              final credential = PhoneAuthProvider.credential(
                verificationId: VerificationId,
                smsCode: '872964',
              );
              try {
                await auth.signInWithCredential(credential);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Homepage()),
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
            child: Text('Verify'),
          )
        ],
      ),
    );
  }
}
