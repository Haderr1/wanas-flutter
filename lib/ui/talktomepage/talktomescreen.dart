import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/talktomepage/personscard.dart';
import 'package:waanaass/ui/talktomepage/previouscard.dart';

import 'greencard.dart';

class talktome extends StatelessWidget {
  const talktome({super.key});
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
            greencard(),
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
                personlist(
                  name: 'Mona',
                  img: 'assets/images/person1.png',
                ),
                personlist(
                  name: 'Mariam',
                  img: 'assets/images/person2.png',
                ),
                personlist(
                  name: 'Ahmed',
                  img: 'assets/images/person3.png',
                ),
                personlist(
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
            previouscarddd(
                namedata: 'Wanas', timedata: '44:00m', datedata: '15-6-2023'),
            previouscarddd(
                namedata: 'Mona', timedata: '55:00m', datedata: '9-6-2023'),
          ],
        ),
      ),
    );
  }
}
