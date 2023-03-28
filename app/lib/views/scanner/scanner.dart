import 'dart:io';
import 'dart:typed_data';

import 'package:app/constants.dart';
import 'package:app/controllers/scanner.dart';
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
      ResolutionPreset.high,
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
        padding: EdgeInsets.only(top: 0.h, left: 35.w, right: 35.w),
        child: Column(
          children: [
            Container(
              child: FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the Future is complete, display the preview.
                    return SizedBox(
                      height: 640 / 1.1.h,
                      width: 360 / 1.0.w,
                      child: CameraPreview(
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
              padding: EdgeInsets.only(top: 40.h),
              child: const Text(
                'Simplify medication  with just a scan, and leave scheduling and reminders to us!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.h),
              child: GestureDetector(
                child: Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white),
                ),
                onTap: () async {
                  try {
                    await _initializeControllerFuture;

                    final image = await _controller.takePicture();
                    print(image.path);

                    if (!mounted) return;

                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplayPictureScreen(
                          imagePath: image.path,
                          file: File(image.path),
                          fileName: image.name,
                        ),
                      ),
                    );
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final File file;
  final String fileName;

  const DisplayPictureScreen(
      {super.key,
      required this.imagePath,
      required this.file,
      required this.fileName});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ScannerService().upload(file),
      //ScannerService().callScannerAPI(file: file, filename: filename),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          appBar: AppBar(title: const Text('Display the Picture')),
          body: Image.file(File(imagePath)),
        );
      },
    );
  }
}
