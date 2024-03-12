import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/TalkToMePage/talkToMeScreen.dart';

class SignupFunction {
   TextEditingController fullNameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController phoneNumberController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  final BuildContext context;

  SignupFunction(this.context,this.fullNameController,this.emailController,this.phoneNumberController,this.passwordController);
  Future<void> signUp() async {


    final String username = fullNameController.text;
    final String email = emailController.text;
    final String phoneNumber = phoneNumberController.text;
    final String password = passwordController.text;

    var url = Uri.http('192.168.56.1:3000', '/account');
    var response = await http.post(
      url,
      body: jsonEncode({
        'name': username,
        'phone': phoneNumber,
        'email': email,
        'password': password,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
      print('Signed up successfully');

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => talkToMeScreen()),
      );

    } else {
// Handle error
      print('Error signing up: ${response.reasonPhrase}');
    }
  }
}
