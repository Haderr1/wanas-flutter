import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api/Api.dart';
import '../LoginPage/login_screen.dart';




class Drawerr extends StatefulWidget {
   Drawerr({super.key});

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
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
     return Drawer(
             child: ListView(padding: EdgeInsets.zero, children: <Widget>[
               DrawerHeader(
                 decoration: const BoxDecoration(
                   image: DecorationImage(
                     image: AssetImage('assets/images/drw.png'),
                     fit: BoxFit.cover,
                   ),
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text(
                       'Wanas',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 24,
                         fontWeight: FontWeight.w700,
                       ),
                     ),
                     const SizedBox(height: 8),
                     if (globalUsername != null)
                       Text(
                         'Welcome ${globalUsername!} !',
                         style: const TextStyle(
                           color: Colors.black,
                           fontSize: 20,
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
                   onTap: () {
                     appConstant.tokenStorage.deleteToken();
                     Navigator.pushReplacement(
                       context,
                       MaterialPageRoute(builder: (context) => LoginScreen()),
                     );
                   },
                 ),
               ),
             ]),
           );
         }
}
