import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/app_constants.dart';

AppConstants appConstant = AppConstants();

Future<String> loginApi(
    String email, String password) async {
  var url = Uri.http(AppConstants.localHost, '/login');


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
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    String token = responseData['token'];
    await appConstant.tokenStorage.saveToken(token);
    print(token);

    return token;
  } else {
    throw Exception('Failed to login');
  }
}