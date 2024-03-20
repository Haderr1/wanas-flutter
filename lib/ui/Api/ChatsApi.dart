import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import 'Api.dart';

Future<List<Chat>> getChatsOfPersonaId(int personaid) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/persona/$personaid');
  try {
    var response = await http.get(
      url,
      headers: await makeHeader(),
    );
    if (response.statusCode == 200) {
      return makeChatList(response.body);
    } else {
      throw Exception('Error getting Chats');
    }
  } catch (e) {
    throw Exception("get chat $e");
  }
}

addNewChat(int personaid) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/persona/$personaid');
  try {
    var response = await http.put(
      url,
      headers: await makeHeader(),
    );
    if (response.statusCode != 200) {
      throw Exception('Error adding New Chat Response: $response');
    }
  } catch (e) {
    throw Exception("get chat $e");
  }
}

class Chat {
  final int chatid;

  const Chat({
    required this.chatid,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int chatid,
      } =>
        Chat(
          chatid: chatid,
        ),
      _ => throw const FormatException('failed to parse chats'),
    };
  }
}

Future<List<Chat>> makeChatList(String elbody) async {
  try {
    List<Chat> chatList = [];
    var parsed = json.decode(elbody);

    if (parsed is List<dynamic>) {
      chatList = (parsed as List).map((i) => Chat.fromJson(i)).toList();
      print("hellofromheer");
    } else {
      print("hhee");
      return chatList;
    }

    return chatList;
  } catch (e) {
    throw Exception("Error parsing list $e");
  }
}
