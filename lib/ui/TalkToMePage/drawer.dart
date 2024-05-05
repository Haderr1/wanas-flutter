import 'package:flutter/material.dart';
import '../Api/Api.dart';
import '../LoginPage/login_screen.dart';
import '../SharedPref/shared_pref.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    SharedPreferencesManager manager = SharedPreferencesManager.instance;
    String globalUsername = manager.getUserName();
    String globalEmail = manager.getEmail();
    return Drawer(
      child: Container(
        color:  const Color(0xFFF9FDFA),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/greennn.jpg"),
                    ),
                    decoration: const BoxDecoration(
                      color:  Color(0xFFF9FDFA),
                      // image: DecorationImage(
                        //     fit: BoxFit.fill,
                        //     image: AssetImage("assets/images/drw.png"))
                          ),
                    accountName: Text(
                      ' $globalUsername ',
                      style: const TextStyle(
                        color: Colors.black,
                         fontSize: 17,
                      ),
                    ),
                    accountEmail: Text(
                      ' $globalEmail ',
                      style: const TextStyle(
                        color: Colors.black,
                         fontSize: 14,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Color(0xFF00966A)),
                    title: const Text(
                      'Profile',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      // Handle profile tab tap
                    },
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Color(0xFF00966A)),
                    title: const Text(
                      'Settings',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      // Handle settings tab tap
                    },
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(Icons.info, color: Color(0xFF00966A)),
                    title: const Text(
                      'About',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      // Handle about tab tap
                    },
                  ),
                  const SizedBox(height: 8),
                  ListTile(
                    leading: const Icon(Icons.help, color: Color(0xFF00966A)),
                    title: const Text(
                      'Help',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      // Handle help tab tap
                    },
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFF66CC99),
              thickness: 1.0,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF00966A)),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                appConstant.tokenStorage.deleteToken();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
