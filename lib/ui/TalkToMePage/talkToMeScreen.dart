import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/Api/Api.dart';
import 'package:waanaass/ui/Buttons/SmallButton.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';
import 'package:waanaass/ui/TalkToMePage/previousConversationsDetailsCard.dart';
import 'startCard.dart';

class talkToMeScreen extends StatefulWidget {
  const talkToMeScreen({super.key});
  static const String routeName = 'talketome';

  @override
  State<talkToMeScreen> createState() => _talkToMeScreenState();
}

class _talkToMeScreenState extends State<talkToMeScreen> {
  late String name;
  late Future<List<PersonaCard>> _futurePersonaCards = fetchPersonaCards();

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              startCard(),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Talk To Someone',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SmallButton(
                      onPressed: () {
                        createPersona(context);
                      },
                      ButtonText: "Add Persona"),
                ],
              ),
              const SizedBox(height: 16),

              // Inserted FutureBuilder here
              FutureBuilder<List<PersonaCard>>(
                future: _futurePersonaCards,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return personsCard(personaCard: snapshot.data![index]);
                      },
                    );
                  }
                },
              ),

              const SizedBox(height: 24),
              const Text(
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
      ),
    );
  }
}
