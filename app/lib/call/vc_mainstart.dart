import 'package:app/call/vc_login.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class MyCall extends StatelessWidget {
  const MyCall({super.key, required this.callID});
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
        appID: 1770479167,
        appSign:
            "b6a02daa356e7ae6400827c0f32977b36d4b4ec51f23026943ab38c7f820bd50",
        userID: "Patient1",
        userName: "Patient",
        callID: callID,

        // Modify your custom configurations here.
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..onOnlySelfInRoom = (context) => Navigator.of(context).pop());
  }
}
