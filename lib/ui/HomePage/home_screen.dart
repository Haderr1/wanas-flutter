import 'package:flutter/material.dart';
import 'package:waanaass/ui/MoodTracker/green_card.dart';
import 'package:waanaass/ui/MoodTracker/mood_tracker_screen.dart';
import 'package:waanaass/ui/TalkToMePage/drawer.dart';
import '../SharedPref/shared_pref.dart';
import '../TalkToMePage/talk_to_me_screen.dart';
import 'Show_chats_home.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SharedPreferencesManager manager = SharedPreferencesManager.instance;
    String globalUsername=manager.getUserName();

    return Scaffold(
      drawer: Drawerr(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height /
                  2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/drw.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content Container
            Container(
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hi, ',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '${globalUsername ?? ""}!',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          iconSize: 26,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'We Wish You Are Happy today',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF00966A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const GreenCard(),
                  ShowChatsHomeCard(
                    imagePath: 'assets/images/showcardimg.png',
                    cardText: 'Show previous conversation',
                    buttonText: 'Show',
                    borderRadius:
                        const BorderRadius.only(topRight: Radius.elliptical(32, 32)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TalkToMeScreen()),
                      );
                    },
                  ),
                  ShowChatsHomeCard(
                    imagePath: 'assets/images/trackmoodcard.png',
                    cardText: 'Track Your Mood!',
                    buttonText: 'Ckeck',
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.elliptical(32, 32)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MoodTrackerScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
