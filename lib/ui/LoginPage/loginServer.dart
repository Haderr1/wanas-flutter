import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import '../Storage/storage.dart';
import '../TalkToMePage/talkToMeScreen.dart';

class loginServer {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final BuildContext context;
  final TokenStorage tokenStorage;
  String local_host = appConstants.LOCAL_HOST;


  loginServer(this.context,this.emailController,this.passwordController): tokenStorage = TokenStorage();

  Future<String> login() async {

    final String email = emailController.text;
    final String password = passwordController.text;
    var url = Uri.http('$local_host:3000', '/account');

    try{
    var response = await http.post(
      url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => talkToMeScreen()),
        );

        // If the server returns a 200 OK response, parse the JSON
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        String token = responseData['token'];
        await tokenStorage.saveToken(token);
        return token;
      } else {
        // If the server did not return a 200 OK response, throw an exception
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('Error signing in: ${e}');

      throw Exception('Failed to connect to server');
    }
  }

}


