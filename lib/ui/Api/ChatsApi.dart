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

    if (response.statusCode == 200 && response.body != null) {
      return makeChatList(response.body);
    } else {
      throw Exception("invalid token");
    }
  } catch (e) {
    log('Error signing in: $e');
    throw Exception('Error getting Chats$e');
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
    List<Chat> chatList;
    chatList =
        (json.decode(elbody) as List).map((i) => Chat.fromJson(i)).toList();

    return chatList;
  } catch (e) {
    throw Exception("Error parsing list $e");
  }
}


