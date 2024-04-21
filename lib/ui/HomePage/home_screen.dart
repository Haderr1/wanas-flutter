import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waanaass/ui/MoodTracker/green_card.dart';
import 'package:waanaass/ui/TalkToMePage/drawer.dart';

import 'Show_chats_home.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? globalUsername;

  Future<void> _getUsername() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      globalUsername = prefs.getString('username');
    });
  }

  @override
  void initState() {
    super.initState();
    _getUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawerr(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background Container with Image
            Container(
              height: MediaQuery.of(context).size.height /
                  2, // Half of the screen height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/drw.png'), // Replace 'assets/background.jpg' with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Content Container
            Container(
              height: MediaQuery.of(context).size.height, // Full screen height
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Drawer Icon

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
                  const ShowChatsHomeCard()

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
