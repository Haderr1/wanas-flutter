import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/SignUpPage.dart';
import 'package:waanaass/ui/loginpage.dart';
import 'package:waanaass/ui/modetracker/modetrackerscreen.dart';
import '../talktomepage/talktomescreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static const String routeName = 'homepage';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final items =[
    const Icon(Icons.home,size: 30,),
    const Icon(Icons.home,size: 30,),
    const Icon(Icons.home,size: 30,),
    const Icon(Icons.home,size: 30,)


  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: TextButton(
              child: Text('Pusht'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return talktome();
                },
              )),
            ),
          ),
          Center(
            child: TextButton(
              child: Text('Pushm'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return modetracker();
                },
              )),
            ),
          ),
          Center(
            child: TextButton(
              child: Text('Pushlogin'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              )),
            ),
          ),
          Center(
            child: TextButton(
              child: Text('Pushsignup'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SignUpPage();
                },
              )),
            ),
          ),
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(items: items),
    );
  }
}


