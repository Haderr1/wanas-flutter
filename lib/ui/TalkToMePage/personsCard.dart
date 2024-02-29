import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MoodTracker/moodTrackerScreen.dart';

class personsCard extends StatelessWidget {
  String name;
  String img;
  personsCard({required this.name, required this.img, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => moodTrackerScreen()),
        );
      },
      child: Column(
        children: [
          Container(
            width: 74,
            height: 79,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF00966A),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(img),
          ),
          SizedBox(width: 4),
          Text(name),
        ],
      ),
    );
  }
}
