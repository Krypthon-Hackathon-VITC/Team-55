import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:app/views/authentications/login_page.dart';
import 'package:app/views/onborad/on_board.dart';
import 'package:app/views/homescreen/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var isCacheExist = await APICacheManager().isAPICacheKeyExist("OnBoard");
  runApp(MedMitra(
    isOnBoard: isCacheExist,
  ));
}

class MedMitra extends StatelessWidget {
  MedMitra({super.key, required this.isOnBoard});

  bool isOnBoard;

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null ? true : false;

    if (isLoggedIn) {
      return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Homepage(),
            );
          });
    } else if (isOnBoard == true) {
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        },
      );
    } else {
      return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: OnBoardPage(),
          );
        },
      );
    }
  }
}
