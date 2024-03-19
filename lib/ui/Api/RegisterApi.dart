import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import '../TalkToMePage/talkToMeScreen.dart';

appConstants appConstant = appConstants();


Future<String> signUpApi(String username, String email, String phoneNumber,
    String password, BuildContext context) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/register');
  var response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'name': username,
      'phone': phoneNumber,
      'email': email,
      'password': password,
    }),
  );
  print(response.body);

  if (response.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => talkToMeScreen()),
    );
    print('Signed up successfully');
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    String token = responseData['token'];
    await appConstant.tokenStorage.saveToken(token);
    return token;

  } else {
// Handle error
    throw Exception('Failed to signup');

  }
}