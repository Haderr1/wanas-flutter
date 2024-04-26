import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/app_constants.dart';

AppConstants appConstant = AppConstants();

Future<String> signUpApi(
    String username, String email, String phoneNumber, String password) async {
  var url = Uri.http(AppConstants.localHost, '/register');
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
  if (kDebugMode) {
    print(response.body);
  }

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Signed up successfully');
    }
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    String token = responseData['token'];
    await appConstant.tokenStorage.saveToken(token);
    return token;
  } else {
    throw Exception('Failed to signup');
  }
}
