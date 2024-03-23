import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/Buttons/small_button.dart';
import 'package:waanaass/ui/ChatPage/chat_screen.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';

import '../Api/chats_api.dart';

class startCard extends StatelessWidget {

  const startCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE0F8E9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Talk to Wanas to',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'start check-in',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                SmallButton(onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) =>  chatScreen(personaid:personaid,chatid: chatid,key: super.key,)),
                  // );
                }, buttonText: "Start")
              ],
            ),
            SizedBox(width: 24),
            Image.asset(
              'assets/images/cardills.png', // Replace with the actual path to your image
            ),
          ],
        ),
      ),
    );
  }
}
