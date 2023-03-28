import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:app/constants.dart';
import 'package:app/views/scanner/Calender_desc.dart';
import 'package:app/views/scanner/scanner.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: Stack(children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox(
              height: constraints.maxHeight / 2,
              child: Column(
                children: const [
                  Header(),
                  SearchBar(),
                  ThreeBoxes(),
                  Card(),
                ],
              ),
            );
          },
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.56,
          minChildSize: 0.56,
          maxChildSize: 0.88,
          builder: ((context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15.h),
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        controller: scrollController,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return CallSection();
                          }
                          if (index == 1) {
                            return TrackSection();
                          }
                          if (index == 2) {
                            return DoctorSection();
                          }
                        }),
                  ),
                  const SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 5,
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ]),
    );
  }
}

class DoctorSection extends StatelessWidget {
  const DoctorSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: darkGrey),
                child: const Text('Our Specialists'),
              ),
              Text(
                'See All',
                style: TextStyle(fontSize: 10.sp),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 40.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: 83.w,
                    height: 33.h,
                    decoration: BoxDecoration(
                        color: index == 0 ? primaryColor : appBarColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: DefaultTextStyle(
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: index == 0 ? Colors.white : darkGrey),
                        child: const Text('ENT'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
            height: 130.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                DocotItemPhoto(
                  path: 'assets/images/doctor1.png',
                  title: 'Dr. Rajashree',
                ),
                DocotItemPhoto(
                  path: 'assets/images/doctor2.png',
                  title: 'Dr. Sufna M',
                ),
                DocotItemPhoto(
                  path: 'assets/images/doctor3.png',
                  title: 'Dr. S Mathur',
                ),
                DocotItemPhoto(
                  path: 'assets/images/doctor4.png',
                  title: 'Dr. Rajesh S',
                ),
                DocotItemPhoto(
                  path: 'assets/images/doctor5.png',
                  title: 'Dr. Pushkar R',
                ),
                DocotItemPhoto(
                  path: 'assets/images/doctor6.png',
                  title: 'Dr. Rajashree',
                ),
              ],
            )),
      ],
    );
  }
}

class TrackSection extends StatelessWidget {
  const TrackSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: darkGrey),
                child: const Text('Your Medicines'),
              ),
              Text(
                'See Track',
                style: TextStyle(fontSize: 10.sp),
              )
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: Image.asset("assets/images/track.png"),
            ),
          ),
        ),
      ],
    );
  }
}

class CallSection extends StatelessWidget {
  const CallSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultTextStyle(
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: darkGrey),
                child: const Text('Call doctor now'),
              ),
              Text(
                'See All',
                style: TextStyle(fontSize: 10.sp),
              )
            ],
          ),
        ),
        SizedBox(
            height: 100.h,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CallItem(
                  path: 'assets/svg/nurse.svg',
                  title: 'Nurse',
                ),
                CallItem(
                  path: 'assets/svg/covid.svg',
                  title: 'Covid 19',
                ),
                CallItem(
                  path: 'assets/svg/dialysis.svg',
                  title: 'Dailysis',
                ),
                CallItem(
                  path: 'assets/svg/checkup.svg',
                  title: 'Checkup',
                ),
                CallItem(
                  path: 'assets/svg/physio.svg',
                  title: 'Physio',
                ),
              ],
            )),
      ],
    );
  }
}

class CallItem extends StatelessWidget {
  CallItem({super.key, required this.path, required this.title});

  String path;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: primaryBackgroundColor,
              child: SvgPicture.asset(path)),
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: DefaultTextStyle(
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Colors.black),
              child: Text(title),
            ),
          ),
        ],
      ),
    );
  }
}

class DocotItemPhoto extends StatelessWidget {
  DocotItemPhoto({super.key, required this.path, required this.title});

  String path;
  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            height: 62.sp,
            width: 62.sp,
            child: CircleAvatar(
              backgroundImage: AssetImage(path),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: DefaultTextStyle(
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  color: Colors.black),
              child: Text(title),
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1.0.sp),
                      child: SvgPicture.asset(
                        'assets/svg/star.svg',
                        height: 10.sp,
                        width: 10.sp,
                      ),
                    ),
                    Text('4.7')
                  ],
                ),
                Text(
                  '+1.6k',
                  style: TextStyle(color: primaryColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 16.h),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          height: 92.h,
          child: Column(children: [
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 11.w, right: 3.w),
                          child: SvgPicture.asset("assets/icons/medicine.svg"),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Buy medicines and Rent Equipments",
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 0, 0, 0)),
                            ),
                            Text(
                              "Superfast delivery                               ",
                              style: GoogleFonts.poppins(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 6.h),
              child: Container(
                height: 23.h,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                      colors: [gradientColor1, gradientColor2],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    )),
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(left: 39.w),
                  child: Text(
                    "Get 100% original medicines.",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ])),
    );
  }
}

class ThreeBoxes extends StatelessWidget {
  const ThreeBoxes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SingleBox(
          imagePath: "assets/images/machine.svg",
          primaryText: 'Lab Tests',
          secondoryText: 'and reports',
        ),
        SingleBox(
          imagePath: "assets/images/doctor.svg",
          primaryText: 'Consult',
          secondoryText: 'Video call',
        ),
        SingleBox(
          imagePath: "assets/images/home.svg",
          primaryText: 'Doctor',
          secondoryText: 'Checkup at home',
        ),
      ],
    );
  }
}

class SingleBox extends StatelessWidget {
  SingleBox(
      {super.key,
      required this.imagePath,
      required this.primaryText,
      required this.secondoryText});

  String imagePath, primaryText, secondoryText;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [gradientColor1, gradientColor2],
            ),
            borderRadius: BorderRadius.circular(8)),
        height: 99.h,
        width: 108.w,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 13.w, top: 14.81.h, right: 55.2.w, bottom: 40.57.h),
              child: SvgPicture.asset(
                imagePath,
                height: 43.62,
                width: 39.48,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 11.w, top: 58.h, right: 28.w, bottom: 26.h),
              child: Text(
                primaryText,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 11.w, top: 76.h, right: 27.w, bottom: 8.h),
              child: Text(
                secondoryText,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.w, left: 21.w),
              child: SvgPicture.asset(
                'assets/icons/logo.svg',
                height: 27.5,
                width: 48,
              ),
            ),
            Text(
              "Hi UserName!",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 2.w,
            ),
            GestureDetector(
              child: Icon(
                PhosphorIcons.caretDown,
                size: 20.0.sp,
              ),
              onTap: () {
                Future<void> _signOut() async {
                  await FirebaseAuth.instance.signOut();
                }

                _signOut();
                APICacheManager().emptyCache();
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.w),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: Icon(
                  PhosphorIcons.personSimpleWalk,
                  size: 26.0.sp,
                  color: primaryColor,
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Icon(
                    PhosphorIcons.microphoneFill,
                    size: 26.0.sp,
                    color: primaryColor,
                  ),
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: Icon(
                  PhosphorIcons.scanFill,
                  size: 26.0.sp,
                  color: primaryColor,
                ),
                onTap: () async {
                  // Obtain a list of the available cameras on the device.
                  final cameras = await availableCameras();

                  // Get a specific camera from the list of available cameras.
                  final firstCamera = cameras[0];
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => ScannerPage(
                                camera: firstCamera,
                              )));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0.sp),
      child: SizedBox(
        height: 35.h,
        child: TextField(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(30.0.sp),
              ),
              hintText: "Doctors, services, medicines...",
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 188, 184, 184)),
              filled: true,
              prefixIcon: Icon(
                PhosphorIcons.magnifyingGlass,
                size: 20.0.sp,
                color: const Color.fromARGB(255, 147, 147, 147),
              )),
        ),
      ),
    );
  }
}
