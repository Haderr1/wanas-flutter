import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MoodTracker/moodTrackerScreen.dart';
import '../chatsmenu/chatsMain.dart';


class PersonaCard {
  final String name;
  final String userID;

  PersonaCard({required this.name, required this.userID});

  factory PersonaCard.fromJson(Map<String, dynamic> json) {
    return PersonaCard(
      name: json['name'],
      userID: json['userID'],
    );
  }
}

class personsCard extends StatelessWidget {
  //String name;
  final PersonaCard personaCard;

  personsCard({required this.personaCard,  super.key});



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => chatsMain(personaid: 1)),
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
            child: Text(personaCard.name),
          ),
          SizedBox(width: 4),
          Text(personaCard.name),
        ],
      ),
    );
  }
}
