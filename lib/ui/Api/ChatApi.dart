import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import 'Api.dart';



Future<String> sendMessage(String message,int personaid,int chatid, BuildContext context) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/persona/$personaid/chat/$chatid');

  try {
    final response = await http.post(
      url,
      headers: await makeHeader(),
      body:jsonEncode({'message': message})
    );
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final aiMessage = jsonResponse['message'];
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