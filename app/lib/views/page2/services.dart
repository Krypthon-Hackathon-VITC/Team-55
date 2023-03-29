import 'package:app/call/vc_mainstart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Services extends StatelessWidget {
  Services({super.key, required this.name, required this.path});
  String path;
  String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(color: Color(0xffF1F4FE)),
        width: 105.w,
        height: 121.h,
        child: Column(
          children: [
            Container(
              width: 95.w,
              height: 77.h,
              child: ClipRRect(
                child: Image.asset(path),
                borderRadius: BorderRadius.circular(10),
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0.h),
              child: Text(name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 9.sp,
                      color: Color(0xff515151))),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
          return MyCall(
            callID: '1',
          );
        }));
      },
    );
  }
}
