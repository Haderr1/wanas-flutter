import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/login_screen.dart';
import '../Api/Api.dart';
import '../HomePage/home_screen.dart';

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
      token = await appConstant.tokenStorage.getToken();
      authenticationToken();
    } catch (e) {
    }
    setState(() {
      const Text("loading authenticating");
    });
  }

  @override
  Widget build(BuildContext context) {
    if (token != null) {
      return  HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
