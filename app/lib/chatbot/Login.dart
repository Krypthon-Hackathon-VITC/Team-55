import 'package:app/chatbot/Startcall.dart';
import 'package:flutter/material.dart';

class IDLogin extends StatelessWidget {
  const IDLogin({super.key});
  static String name = "";
  static String ID = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextField(
              onChanged: (value) {
                name = value;
              },
              decoration: InputDecoration(
                  hintText: "Name", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                ID = value;
              },
              decoration:
                  InputDecoration(hintText: "ID", border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
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
