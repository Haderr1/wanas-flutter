import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/Buttons/add_persona_button.dart';
import 'package:waanaass/ui/LoginPage/login_screen.dart';
import 'package:waanaass/ui/TalkToMePage/persons_card.dart';
import 'package:waanaass/ui/TalkToMePage/previous_conversations_details_card.dart';
import '../Api/persona_api.dart';
import 'start_card.dart';

class TalkToMeScreen extends StatefulWidget {
  const TalkToMeScreen({super.key});
  static const String routeName = 'talketome';

  @override
  State<TalkToMeScreen> createState() => _TalkToMeScreenState();
}

class _TalkToMeScreenState extends State<TalkToMeScreen> {
  Future<List<PersonaCard>> _futurePersonaCards = fetchPersonaCards();
  void _createAndFetchPersona(BuildContext context) async {
    String? name;
    name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Name'),
        content: TextField(
          onChanged: (value) => name = value,
          decoration: const InputDecoration(hintText: 'Name'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(name);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );

    if (name != null) {
      await createPersona(name!);
      setState(() {
        _futurePersonaCards = fetchPersonaCards();
      });
    }
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
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/drw.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                // Text(
                //   'John Doe', // Replace with the username
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 20,
                //   ),
                // ),
                Text(
                  'Welcome To Wanas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 430,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.only(left: 8),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color(0xFF00966A),
                  width: 2.0,
                ),
              ),
            ),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app_outlined), // Add an icon
              title: const Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {},
            ),
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StartCard(),
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
                            return PersonsCard(
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
              PreviousConversationsDetailsCard(
                  namedata: 'Wanas', timedata: '44:00m', datedata: '15-6-2023'),
              PreviousConversationsDetailsCard(
                  namedata: 'Mona', timedata: '55:00m', datedata: '9-6-2023'),
            ],
          ),
        ),
      ),
    );
  }
}
