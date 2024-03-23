import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import 'Api.dart';

Future<List<Chat>> getChatsOfPersonaId(int personaId) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/persona/$personaId');
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

addNewChat(int personaId) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/persona/$personaId');
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
  final int chatId;

  const Chat({
    required this.chatId,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int chatid,
      } =>
        Chat(
          chatId: chatid,
        ),
      _ => throw const FormatException('failed to parse chats'),
    };

  }
}

Future<List<Chat>> makeChatList(String body) async {
  try {
    List<Chat> chatList = [];
    var parsed = json.decode(body);

    if (parsed is List<dynamic>) {
      chatList = (parsed).map((i) => Chat.fromJson(i)).toList();
      print("hello from her");
    } else {
      print("thee");
      return chatList;
    }

    return chatList;
  } catch (e) {
    throw Exception("Error parsing list $e");
  }
}
