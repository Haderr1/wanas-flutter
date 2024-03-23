import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/login_screen.dart';
import 'package:waanaass/ui/TalkToMePage/talkToMeScreen.dart';
import '../Api/Api.dart';
import '../Storage/storage.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
    static const String routeName = 'auth';


  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  String? token;

  @override
  void initState() {
    super.initState();
    getToken();
  }

  Future<void> getToken() async {
    try {
      TokenStorage tokenStorage = TokenStorage();
      token = await tokenStorage.getToken();
      authenticationToken();
    } catch (e) {
      rethrow;
    }
    setState(() {
      const Text("loading authenticating");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (token != null) {
      return const talkToMeScreen();
    } else {
      return LoginScreen();
    }
  }
}
