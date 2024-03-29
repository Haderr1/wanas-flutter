import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/Buttons/AddPersonaButton.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';
import 'package:waanaass/ui/TalkToMePage/previousConversationsDetailsCard.dart';
import '../Api/ChatsApi.dart';
import '../Api/PersonaApi.dart';
import 'startCard.dart';

class talkToMeScreen extends StatefulWidget {

  const talkToMeScreen({ super.key});
  static const String routeName = 'talketome';

  @override
  State<talkToMeScreen> createState() => _talkToMeScreenState();
}

class _talkToMeScreenState extends State<talkToMeScreen> {


  Future<List<PersonaCard>> _futurePersonaCards = fetchPersonaCards();
  void _createAndFetchPersona(BuildContext context) async {
    await createPersona(context);
    setState(() {
      _futurePersonaCards = fetchPersonaCards();
    });
  }

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
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Talk To Someone',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              FutureBuilder<List<PersonaCard>>(
                future: _futurePersonaCards,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    if (snapshot.data == null) {
                      return AddPersonaButton(onTap: () {
                        _createAndFetchPersona(context);
                      });
                    }
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return SizedBox(
                      height: 90,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == snapshot.data!.length) {
                            return AddPersonaButton(onTap: () {
                              _createAndFetchPersona(context);
                            });
                          } else {
                            return personsCard(
                                personaCard: snapshot.data![index]);
                          }
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                      ),
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
