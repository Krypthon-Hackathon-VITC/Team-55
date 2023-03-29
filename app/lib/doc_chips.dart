import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class docchips extends StatelessWidget {
  docchips({super.key, required this.path, required this.name});
  String path;
  String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: Container(
        width: 167.w,
        height: 65.39.h,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffD3E0FF)),
            borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(path),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(fontSize: 9.sp, color: Colors.black,fontWeight: FontWeight.w600),
              ),
              Text(
                "Physiotherepist",
                style: GoogleFonts.poppins(fontSize: 9.sp, color: Colors.black),
              ),
              Row(
                children: [
                  Icon(
                    PhosphorIcons.mapPinBold,
                    size: 15.0,
                    color: Color(0xff3B63DA),
                  ),
                  Text(
                    "600m",
                    style: GoogleFonts.poppins(
                        fontSize: 9.sp, color: Colors.black),
                  ),
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
