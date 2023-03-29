import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class chatbot extends StatelessWidget {
  const chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: TextButton(
        child: Text("bot"),
        onPressed: () async {
          dynamic conversationObject = {
            'appId':
                '18c5a7d948e8ca9e7d8ee6ba78a1b944', // The APP_ID obtained from kommunicate dashboard.
          };
          KommunicateFlutterPlugin.buildConversation(conversationObject)
              .then((clientConversationId) {
            print("Conversation builder success : " +
                clientConversationId.toString());
          }).catchError((error) {
            print("Conversation builder error : " + error.toString());
          });
        },
      )),
    );
  }
}
