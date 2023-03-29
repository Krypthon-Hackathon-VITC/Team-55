import 'package:app/constants.dart';
import 'package:app/doc_chips.dart';
import 'package:app/services.dart';
import 'package:app/views/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorSearch extends StatelessWidget {
  const DoctorSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          SearchBar(),
          Padding(
            padding: EdgeInsets.only(top: 0.h, right: 220.w),
            child: Text("My appoinments",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Color.fromARGB(255, 2, 2, 2))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF1F4FE),
              ),
              width: 356.w,
              height: 41.h,
              child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/Doctor_blue.svg"),
                      Text("View your appoinments",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              color: Color(0xff3B63DA))),
                      Icon(
                        PhosphorIcons.caretRight,
                        size: 32.0,
                        color: Color(0xff3B63DA),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h, right: 230.w),
            child: Text("Our Specialists",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Color.fromARGB(255, 2, 2, 2))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Services(
                    name: "General Physician/Internal Medicine",
                    path: "assets/pic9.png"),
                Services(name: "Cardiology", path: "assets/pic8.png"),
                Services(name: "Orthopedics", path: "assets/pic7.png"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Services(name: "Paediatrics", path: "assets/pic10.png"),
                Services(name: "Dermatology", path: "assets/pic11.png"),
                Services(
                    name: "Gynaecology/Obstetrics", path: "assets/pic12.png"),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 19.h, right: 180.w, left: 10.w),
            child: Text("Your Dorstep doctors",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Color.fromARGB(255, 2, 2, 2))),
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  docchips(
                    name: 'Dr. Ranjan Singh',
                    path: 'assets/pic13.png',
                  ),
                  docchips(
                    name: 'Dr. Akhil Sharma',
                    path: 'assets/pic14.png',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.w, top: 16.h),
            child: Row(
              children: [
                Image.asset("assets/pic15.png"),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                      "Feeling unwell? Don't wait to get better,\ntalk to our chatbot now",
                      maxLines: 2,
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 22.h),
            child: Container(
                width: 326.w,
                height: 42.h,
                decoration: BoxDecoration(
                    color: Color(0xff3B63DA),
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                    onPressed: () {},
                    child: Text("Search and book appoinments",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, color: Colors.white)))),
          ),
        ],
      ),
    ));
  }
}
