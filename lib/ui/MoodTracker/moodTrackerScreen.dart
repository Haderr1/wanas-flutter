import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/MoodTracker/moodChart.dart';
import 'calendar.dart';
import 'emojisCard.dart';

class moodTrackerScreen extends StatefulWidget {
  const moodTrackerScreen({super.key});
  static const String routeName = 'moodTrackerScreen';

  @override
  State<moodTrackerScreen> createState() => _moodTrackerScreenState();
}

class _moodTrackerScreenState extends State<moodTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mode Tracker'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              calendar(),
              emjscard(),
              SizedBox(
                height: 16,
              ),
              Text(
                'Mode Chart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'How your mood changes over time',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildSquareWithText('Normal', Color(0xFF66C0A6)),
                  buildSquareWithText('Tense', Color(0xFFFFE86D)),
                  buildSquareWithText('Angry', Color(0xFFFF4B4B)),
                  buildSquareWithText('Sad', Color(0xFF79AEFC)),
                  buildSquareWithText('Happy', Color(0xFFFBADEE)),
                ],
              ),
              moodChart(),
            ]),
          ),
        ));
  }

  Widget buildSquareWithText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            color: color,
          ),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
                color: Color(0xFFB6B6BE),
                fontSize: 10,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
