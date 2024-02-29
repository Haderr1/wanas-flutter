import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';
import 'package:waanaass/ui/TalkToMePage/previousConversationsDetailsCard.dart';
import 'startCard.dart';

class talkToMeScreen extends StatelessWidget {
  const talkToMeScreen({super.key});
  static const String routeName = 'talketome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Talk To Me",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            startCard(),
            SizedBox(
              height: 24,
            ),
            Text(
              'Talk To Some One',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                personsCard(
                  name: 'Mona',
                  img: 'assets/images/person1.png',
                ),
                personsCard(
                  name: 'Mariam',
                  img: 'assets/images/person2.png',
                ),
                personsCard(
                  name: 'Ahmed',
                  img: 'assets/images/person3.png',
                ),
                personsCard(
                  name: 'Wanas',
                  img: 'assets/images/person4.png',
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Previous conversations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            previousConversationsDetailsCard(
                namedata: 'Wanas', timedata: '44:00m', datedata: '15-6-2023'),
            previousConversationsDetailsCard(
                namedata: 'Mona', timedata: '55:00m', datedata: '9-6-2023'),
          ],
        ),
      ),
    );
  }
}
