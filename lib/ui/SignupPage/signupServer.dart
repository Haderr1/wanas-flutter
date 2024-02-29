import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SignupFunction {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> signUp() async {
    final String username = fullNameController.text;
    final String email = emailController.text;
    final String phoneNumber = phoneNumberController.text;
    final String password = passwordController.text;

    var url = Uri.http('192.168.1.5:3000', '/account');
    var response = await http.post(
      url,
      body: jsonEncode({
        'PhoneNumber': phoneNumber,
        'username': username,
        'email': email,
        'password': password,
      }),
    );
    print(response.body);

    if (response.statusCode == 200) {
// Successfully signed up
      print('Signed up successfully');

    } else {
// Handle error
      print('Error signing up: ${response.reasonPhrase}');
    }
  }
}
