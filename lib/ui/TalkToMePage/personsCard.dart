import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../chatsmenu/chats_main.dart';

class PersonaCard {
  final int id;
  final String name;

  PersonaCard({required this.name, required this.id});

  factory PersonaCard.fromJson(Map<String, dynamic> json) {
    return PersonaCard(
      id: json['id'],
      name: json['name'],
    );
  }
}

class personsCard extends StatelessWidget {
  //String name;
  final PersonaCard personaCard;

  const personsCard({required this.personaCard, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ChatsMain(personaid: personaCard.id, key: super.key)),
        );
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: 74,
            height: 79,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF00966A),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "id:${personaCard.id} name: ${personaCard.name.trim()}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF00966A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
