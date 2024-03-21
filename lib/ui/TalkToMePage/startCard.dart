import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/Buttons/SmallButton.dart';
import 'package:waanaass/ui/ChatPage/chatScreen.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';

import '../Api/ChatsApi.dart';

class startCard extends StatelessWidget {
  final int chatid;
  final int personaid;

  const startCard({required this.chatid,required this.personaid,super.key});

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  chatScreen(personaid:personaid,chatid: chatid,key: super.key,)),
                  );
                }, ButtonText: "Start")
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
