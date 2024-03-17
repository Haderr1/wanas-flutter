import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/chatScreen.dart';
import '../Api/Api.dart';

class ChatsCard extends StatelessWidget {
  Chat elchat;
  ChatsCard({required this.elchat, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => chatScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 20, // Change the font size
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Change the border radius
        ),
      ),
      child: Text("chat " + elchat.chatid.toString()),
    );
  }
}
