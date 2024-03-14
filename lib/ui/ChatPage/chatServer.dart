
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import 'dart:convert';
import 'package:waanaass/ui/LoginPage/loginServer.dart';
import 'package:waanaass/ui/Storage/storage.dart';




class chatServer {
  TokenStorage tokenStorage= TokenStorage();
  String local_host = appConstants.LOCAL_HOST;

  Future<String> sendMessage(String userToken, String message, BuildContext context) async {
    var url = Uri.http('$local_host:3000', '/account');

    try {
      String? token = await tokenStorage.getToken();

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: {'message': message},
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final aiMessage = jsonResponse['ai_message'];
        return aiMessage;
      } else {
        throw Exception('Failed to send message');
      }
    } catch (e) {
      // Show error message in a popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to send message: $e"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      throw Exception('Failed to send message: $e');
    }
  }

}



//
// class chatServer {
//   var url = Uri.http('192.168.1.5:3000', '/hh');
//
//   Future<String> sendMessage(String userToken, String message) async {
//
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': 'Bearer $userToken',
//         },
//         body: {'message': message},
//       );
//       if (response.statusCode == 200) {
//         // Parse the AI response from the server and return it
//         final jsonResponse = json.decode(response.body);
//         final aiMessage = jsonResponse['ai_message'] ;
//         return aiMessage;
//       } else {
//         throw Exception('Failed to send message');
//       }
//     } catch (e) {
//       throw Exception('Failed to send message: $e');
//     }
//   }
// }

// class chatServer {
//   var url = Uri.http('192.168.1.5:3000', '/account');
//
//   Future<String> sendMessage(String userToken, String message) async {
//     try {
//       final response = await http.post(
//         url,
//         headers: {
//           'Authorization': 'Bearer $userToken',
//         },
//         body: {'message': message},
//       );
//       if (response.statusCode == 200) {
//         // Parse the AI response from the server and return it
//         final jsonResponse = json.decode(response.body) as Map<String, dynamic>;
//         final aiMessage = jsonResponse['ai_message'] as String;
//         return aiMessage;
//       } else {
//         throw Exception('Failed to send message');
//       }
//     } catch (e) {
//       throw Exception('Failed to send message: $e');
//     }
//   }
// }
//


// class ChatServer {
//   Future<String> sendMessage(String userToken, String message) async {
//     try {
//       final response = await http.post(
//         Uri.parse('http://your-go-server-url'), // Replace with your Go server URL
//         headers: {
//           'Authorization': 'Bearer $userToken',
//         },
//         body: {'message': message},
//       );
//       if (response.statusCode == 200) {
//         // Parse the AI response from the server and return it
//         final jsonResponse = json.decode(response.body);
//         final aiMessage = jsonResponse['ai_message'];
//         return aiMessage;
//       } else {
//         throw Exception('Failed to send message');
//       }
//     } catch (e) {
//       throw Exception('Failed to send message: $e');
//     }
//   }
// }

// Future<void> anotherRequest() async {
//   String? token = await loginServer.getToken();
//   if (token != null) {
//     var url = Uri.http('your_api_url', '/your_endpoint');
//     var response = await http.get(
//       url,
//       headers: <String, String>{
//         'Authorization': 'Bearer $token',
//       },
//     );
//     // Handle response
//   } else {
//     // Token not found, handle accordingly
//   }
// }
