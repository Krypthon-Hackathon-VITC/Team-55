import 'package:app/controllers/profile.dart';
import 'package:app/views/homepage/homepage.dart';
import 'package:app/views/mainmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = new TextEditingController();
    TextEditingController dateController = new TextEditingController();
    TextEditingController monthController = new TextEditingController();
    TextEditingController yearController = new TextEditingController();
    TextEditingController feetController = new TextEditingController();

    TextEditingController inchController = new TextEditingController();

    TextEditingController weightController = new TextEditingController();

    TextEditingController bloodController = new TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Profile",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Color.fromARGB(255, 2, 2, 2))),
        leading: Icon(
          PhosphorIcons.caretLeft,
          color: Colors.black,
          size: 26.0,
        ),
        backgroundColor: Color(0xffF1F4FE),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0.w, right: 10.w, top: 44.h),
            child: Container(
              width: 328.w,
              height: 45.h,
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    hintText: "Enter full name",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 20.h, right: 250.w),
            child: Text("Date of Birth*",
                style: GoogleFonts.poppins(
                    fontSize: 11.sp, color: Color.fromARGB(255, 2, 2, 2))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10, top: 9.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 90.w,
                  height: 39.h,
                  child: TextField(
                    controller: dateController,
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        hintText: "Date",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  width: 103.w,
                  height: 39.h,
                  child: TextField(
                    controller: monthController,
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        hintText: "Month",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  width: 90.w,
                  height: 39.h,
                  child: TextField(
                    controller: yearController,
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        hintText: "Year",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 26.h),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Radio(
                      value: "radio value",
                      groupValue: "group value",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                ),
                Text(
                  "Male",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Radio(
                      value: "radio value",
                      groupValue: "group value",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                ),
                Text(
                  "Female",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Radio(
                      value: "radio value",
                      groupValue: "group value",
                      onChanged: (value) {
                        print(value); //selected value
                      }),
                ),
                Text(
                  "Others",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 34.h),
            child: Container(
                width: 332.w,
                child: Divider(
                  thickness: 2,
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 26.h, left: 10.w, right: 170.w),
            child: Text(
              "Essential Information",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 26.w),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset("assets/images/pic5.png"),
                ),
                Container(
                  height: 45.h,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: TextField(
                      controller: feetController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: "Feet",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                Container(
                  height: 45.h,
                  width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: TextField(
                      controller: inchController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: "Inches",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 26.w),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset("assets/images/pic6.png"),
                ),
                Container(
                  height: 45.h,
                  width: 193.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: TextField(
                      controller: weightController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: "Enter your weight",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 26.w),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  child: Image.asset("assets/images/pic4.png"),
                ),
                Container(
                  height: 45.h,
                  width: 193.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: TextField(
                      controller: bloodController,
                      keyboardType: TextInputType.name,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                          hintText: "Enter Blood group",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFB1B1B1)),
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 70.h),
            child: Container(
                width: 326.w,
                height: 42.h,
                decoration: BoxDecoration(
                    color: Color(0xff3B63DA),
                    borderRadius: BorderRadius.circular(11)),
                child: TextButton(
                    onPressed: () {
                      var _user = {
                        "name": nameController.text.toString(),
                        "phone_number": FirebaseAuth
                            .instance.currentUser!.phoneNumber
                            .toString(),
                        "fcm_token":
                            FirebaseAuth.instance.currentUser!.uid.toString(),
                        "firebase_id":
                            FirebaseAuth.instance.currentUser!.uid.toString(),
                        "dob": "2023-03-28T14:10:57.087Z",
                        "gender": 'Male',
                        "height": feetController.text.toString() +
                            inchController.text.toString(),
                        "weight": weightController.text.toString()
                      };
                      ProfileController().postCustomer(_user);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MainMenu(),
                        ),
                      );
                    },
                    child: Text("Continue",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, color: Colors.white)))),
          ),
        ],
      ),
    );
  }
}
