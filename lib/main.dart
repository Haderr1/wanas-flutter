import 'package:flutter/material.dart';
import 'package:waanaass/ui/Authentication/AuthLogin.dart';
import 'package:waanaass/ui/HomePage/home_screen.dart';
import 'package:waanaass/ui/LoginPage/login_screen.dart';
import 'package:waanaass/ui/MoodTracker/mood_tracker_screen.dart';
import 'package:waanaass/ui/SharedPref/shared_pref.dart';
import 'package:waanaass/ui/SignupPage/signup_screen.dart';
import 'package:waanaass/ui/TalkToMePage/talk_to_me_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        SignupScreen.routeName : (_)=>   const SignupScreen(),
        AuthPage.routeName : (_)=> const AuthPage(),
        HomeScreen.routeName : (_)=>  HomeScreen(),



      },
      initialRoute: AuthPage.routeName ,
    );
  }
}


