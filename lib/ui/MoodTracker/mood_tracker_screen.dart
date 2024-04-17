import 'package:flutter/material.dart';
import 'package:waanaass/ui/MoodTracker/mood_chart.dart';
import 'calendar.dart';
import 'emojis_card.dart';
import 'green_card.dart';

class MoodTrackerScreen extends StatefulWidget {
  const MoodTrackerScreen({super.key});
  static const String routeName = 'moodTrackerScreen';

  @override
  State<MoodTrackerScreen> createState() => _MoodTrackerScreenState();
}

class _MoodTrackerScreenState extends State<MoodTrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mode Tracker'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Calendar(),
              const GreenCard(),
              const EmojisCard(),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Mode Chart',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Text(
                'How your mood changes over time',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildSquareWithText('Normal', const Color(0xFF66C0A6)),
                  buildSquareWithText('Tense', const Color(0xFFFFE86D)),
                  buildSquareWithText('Angry', const Color(0xFFFF4B4B)),
                  buildSquareWithText('Sad', const Color(0xFF79AEFC)),
                  buildSquareWithText('Happy', const Color(0xFFFBADEE)),
                ],
              ),
              const MoodChart(),
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
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(
                color: Color(0xFFB6B6BE),
                fontSize: 10,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
