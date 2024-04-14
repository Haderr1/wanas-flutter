import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/app_constants.dart';
import 'Api.dart';

Future<String> sendMessage(
  String message,
  int personaId,
  int chatId,
) async {
  var url =
      Uri.http(AppConstants.localHost, '/persona/$personaId/chat/$chatId');

  try {
    final response = await http.post(url,
        headers: await makeHeader(), body: jsonEncode({'message': message}));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final aiMessage = jsonResponse['message'];
      return aiMessage;
    } else {
      throw Exception('Failed to send message');
    }
  } catch (e) {
    throw Exception('Failed to send message: $e');
  }
}

Future<bool> checkServerAvailability() async {
  var url = Uri.http(AppConstants.localHost, '/persona');

  try {
    final response = await http.head(url);
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}

class MessageData {
  final String message;
  final bool isUserMessage;
  final DateTime createdDate;

  MessageData({
    required this.message,
    required this.isUserMessage,
    required this.createdDate,
  });

  factory MessageData.fromJson(Map<String, dynamic> json) {
    return MessageData(
      message: json['message'],
      isUserMessage: json['state'],
      createdDate: DateTime.parse(json['createdat']),
    );
  }
}

Future<List<MessageData>> getMessage(int personaId, int chatId) async {
  var url =
      Uri.http(AppConstants.localHost, '/persona/$personaId/chat/$chatId');

  try {
    final response = await http.get(
      url,
      headers: await makeHeader(),
    );

    if (kDebugMode) {
      print('Response Body: ${response.body}');
    }

    if (response.statusCode == 200) {
     return makeMessageList(response.body);
    } else {

      throw Exception('Failed to get messages: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to get messages: $e');
  }
}

Future<List<MessageData>> makeMessageList(String body) async {
  try {
    List<MessageData> messageList = [];
    var parsed = json.decode(body);

    if (parsed is List<dynamic>) {
      messageList = (parsed).map((i) => MessageData.fromJson(i)).toList();
    } else {
      return messageList;
    }

    return messageList;
  } catch (e) {
    throw Exception("Error parsing list $e");
  }
}

