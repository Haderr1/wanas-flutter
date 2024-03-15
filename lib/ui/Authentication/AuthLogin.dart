import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/LoginPage/loginScreen.dart';
import 'package:waanaass/ui/TalkToMePage/talkToMeScreen.dart';

import '../Storage/storage.dart';
class authPage extends StatefulWidget {
  const authPage({Key? key}) : super(key: key);

  @override
  _authPageState createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  late Future<String?> _tokenFuture;

  @override
  void initState() {
    super.initState();
    _tokenFuture = TokenStorage().getToken();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _tokenFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          String? token = snapshot.data;
          if (token != null) {
            return talkToMeScreen();
          } else {
            return loginScreen();
          }
        }
      },
    );
  }
}
