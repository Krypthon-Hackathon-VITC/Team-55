import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:app/constants.dart';
import 'package:app/views/authentications/login_page.dart';
import 'package:app/views/onborad/on_board_screen1.dart';
import 'package:app/views/onborad/on_board_screen2.dart';
import 'package:app/views/onborad/on_board_screen3.dart';
import 'package:app/views/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardPage extends StatefulWidget {
  OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int currentIndex = 0;

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: onBoardBackground,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                OnBoardScreen1(),
                OnBoardScreen2(),
                OnBoardScreen3(),
              ],
            ),
          ),
          Container(
            height: 145.h,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 40.w, right: 40.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: EdgeInsets.only(right: 5.w, top: 25.h),
                              child: BuildDots(index),
                            )),
                  ),
                  GestureDetector(
                    child: Container(
                      width: 114.w,
                      height: 52.h,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(26.sp),
                      ),
                      child: Center(
                        child: Text(
                          currentIndex == 3 - 1 ? "Continue" : "Next",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (currentIndex == 3 - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginPage(),
                          ),
                        );
                        APICacheDBModel cacheDBModel =
                            APICacheDBModel(key: "OnBoard", syncData: "done");
                        await APICacheManager().addCacheData(cacheDBModel);
                      }
                      _controller.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container BuildDots(int index) {
    return Container(
      height: 5.sp,
      width: currentIndex == index ? 40 : 10,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(100.sp),
      ),
    );
  }
}
