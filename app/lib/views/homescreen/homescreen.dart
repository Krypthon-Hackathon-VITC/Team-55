import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Text('Log out'),
          onTap: () {
            Future<void> _signOut() async {
              await FirebaseAuth.instance.signOut();
              print("logout");
            }

            _signOut();
          },
        ),
      ),
    );
  }
}
