// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:waanaass/main.dart';
// import 'package:waanaass/ui/chatsmenu/chatsMain.dart';
// import '../Storage/storage.dart';
//
// class GetChats {
//   final BuildContext context;
//   final int personaid;
//
//   GetChats(this.context, this.personaid);
//
//   Future<String> login() async {
//     var url = Uri.http('localhost:3000', '/login');
//     try {
//       var eltoken;
//
//       TokenStorage tokenStorage = TokenStorage();
//       eltoken = await tokenStorage.getToken();
//
//       try {
//         var response = await http.post(
//           url,
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'x-jwt-token': eltoken
//           },
//         );
//
//         if (response.statusCode == 200) {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => chatsMain(
//                       personaid: 1,
//                     )),
//           );
//
//           // If the server returns a 200 OK response, parse the JSON
//           final Map<String, dynamic> responseData = jsonDecode(response.body);
//           String token = responseData['token'];
//           await tokenStorage.saveToken(token);
//           return token;
//         } else {
//           // If the server did not return a 200 OK response, throw an exception
//           throw Exception('Failed to login');
//         }
//       } catch (e) {
//         print('Error signing in: ${e}');
//
//         throw Exception('Failed to connect to server');
//       }
//     } catch (e) {
//       print('Error signing in: ${e}');
//
//       throw Exception('Failed to connect to server');
//     }
//   }
// }
