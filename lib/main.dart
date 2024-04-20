import 'package:flutter/material.dart';
import 'package:waanaass/ui/Authentication/AuthLogin.dart';
import 'package:waanaass/ui/HomePage/home_screen.dart';
import 'package:waanaass/ui/LoginPage/login_screen.dart';
import 'package:waanaass/ui/MoodTracker/mood_tracker_screen.dart';
import 'package:waanaass/ui/SignupPage/signup_screen.dart';
import 'package:waanaass/ui/TalkToMePage/talk_to_me_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),
      routes:{
        TalkToMeScreen.routeName : (_)=> const TalkToMeScreen(),
        MoodTrackerScreen.routeName : (_)=> const MoodTrackerScreen(),
        LoginScreen.routeName : (_)=> LoginScreen(),
        SignupScreen.routeName : (_)=>   SignupScreen(),
        AuthPage.routeName : (_)=> const AuthPage(),
        HomeScreen.routeName : (_)=> const HomeScreen(),


      },
      initialRoute: AuthPage.routeName ,
    );
  }
}


