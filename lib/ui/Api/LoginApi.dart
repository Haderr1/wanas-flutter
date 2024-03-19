import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import '../TalkToMePage/talkToMeScreen.dart';

appConstants appConstant = appConstants();

Future<String> loginApi(
    String email, String password, BuildContext context) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/login');


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
    await appConstant.tokenStorage.saveToken(token);
    print(token);

    return token;
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to login');
  }
}