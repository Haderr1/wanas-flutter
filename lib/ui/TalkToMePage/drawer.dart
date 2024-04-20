import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Api/Api.dart';
import '../LoginPage/login_screen.dart';




class Drawerr extends StatelessWidget {
   Drawerr({super.key});
    String? globalUsername;

   @override
   Widget build(BuildContext context) {
     return FutureBuilder(
       future: SharedPreferences.getInstance(),
       builder: (context, snapshot) {
         if (snapshot.hasData) {
           final prefs = snapshot.data;
           if (prefs != null) {
             globalUsername = prefs.getString('username');
           }
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
         } else {
           return const CircularProgressIndicator();
         }
       },
     );
   }
}
