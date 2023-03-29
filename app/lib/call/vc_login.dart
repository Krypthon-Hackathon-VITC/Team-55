import 'package:app/call/vc_startcall.dart';
import 'package:flutter/material.dart';

class IDLogin extends StatelessWidget {
  const IDLogin({super.key});
  static String name = "Paitent";
  static String ID = "KRYPT123";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Joincall()),
                )
              },
              child: Text("Join"),
            )
          ]),
        ),
      ),
    );
  }
}
