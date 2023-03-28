import 'dart:typed_data';

import 'package:app/constants.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scannerBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scannerBackground,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.h, left: 35.w, right: 35.w),
        child: Column(
          children: [
            Container(
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return CameraPreview(
                      _controller,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RotationTransition(
                                    turns: AlwaysStoppedAnimation(270 / 360),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset(
                                          'assets/icons/anchor_point.svg'),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SvgPicture.asset(
                                        'assets/icons/anchor_point.svg'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RotationTransition(
                                    turns: AlwaysStoppedAnimation(90 / 360),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: SvgPicture.asset(
                                          'assets/icons/anchor_point_flip.svg'),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SvgPicture.asset(
                                        'assets/icons/anchor_point_flip.svg'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    // Otherwise, display a loading indicator.
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 74.h),
              child: const Text(
                'Simplify medication  with just a scan, and leave scheduling and reminders to us!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 60.h),
              child: Container(
                height: 70.h,
                width: 70.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
