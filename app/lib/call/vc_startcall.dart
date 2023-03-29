import 'package:app/call/vc_mainstart.dart';
import 'package:flutter/material.dart';

class Joincall extends StatelessWidget {
  const Joincall({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: ElevatedButton(
            child: Text("Join call"),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCall(callID: "1")),
              )
            },
          ),
        ),
      ),
    );
  }
}
