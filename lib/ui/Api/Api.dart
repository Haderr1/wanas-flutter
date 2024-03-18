import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';
import '../Storage/storage.dart';
import '../TalkToMePage/talkToMeScreen.dart';

String local_host = appConstants.LOCAL_HOST;
late final TokenStorage tokenStorage;
String? token;

Future<Map<String, String>> makeHeader() async {
  try {
    TokenStorage tokenStorage = TokenStorage();
    String eltoken = await tokenStorage.getToken();

    Map<String, String> elheader = new Map();
    elheader['Content-Type'] = 'application/json; charset=UTF-8';
    elheader['x-jwt-token'] = eltoken;
    return elheader;
  } catch (e) {
    throw Exception('not authenticated because $e');
  }
}

authenttoken() async {
  var url = Uri.http('localhost:3000', '/user');
  try {
    var response = await http.get(
      url,
      headers: await makeHeader(),
    );
    authentresp(response);
  } catch (e) {
    rethrow;
  }
}

authentresp(http.Response response) async {
  TokenStorage ts = TokenStorage();
  if (response.statusCode == 403) {
    ts.deletetoken();
    throw Exception("invalid token");
  }
}

// Future<void> getToken() async {
//   TokenStorage tokenStorage = TokenStorage();
//   token = await tokenStorage.getToken();
// }
//String? token = await tokenStorage.getToken();

Future<String> loginApi(
    final email, final password, BuildContext context) async {
  var url = Uri.http('localhost:3000', '/login');
  print(email);

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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => talkToMeScreen()),
    );

    // If the server returns a 200 OK response, parse the JSON
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    String token = responseData['token'];
    await tokenStorage.saveToken(token);
    print(token);

    return token;
  } else {
    // If the server did not return a 200 OK response, throw an exception
    throw Exception('Failed to login');
  }
}

Future<String> signUpApi(String username, String email, String phoneNumber,
    String password, BuildContext context) async {
  var url = Uri.http('localhost:3000', '/register');
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
  print(response.body);

  if (response.statusCode == 200) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => talkToMeScreen()),
    );
    print('Signed up successfully');
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    String token = responseData['token'];
    await tokenStorage.saveToken(token);
    return token;

  } else {
// Handle error
    throw Exception('Failed to signup');

  }
}

Future<String> sendMessage(String message, BuildContext context) async {
  var url = Uri.http('$local_host:3000', '/account');

  try {
    final response = await http.post(
      url,
      headers: authenttoken(),
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

/////////////////////////////////////////////////////////////////////////////////

Future<List<Chat>> getChatsOfPersonaId(int personaid) async {
  var url = Uri.http('localhost:3000', '/persona/$personaid');
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


// class signup {
//   final int chatid;
//
//   const Chat({
//     required this.chatid,
//   });
//
//   factory Chat.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {
//       'id': int chatid,
//       } =>
//           Chat(
//             chatid: chatid,
//           ),
//       _ => throw const FormatException('failed to parse chats'),
//     };
//   }
// }

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

////////////////////////////

Future<void> createPersona( BuildContext context) async {
  String? name;
  name = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Enter Name'),
      content: TextField(
        onChanged: (value) => name = value,
        decoration: InputDecoration(hintText: 'Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(name);
          },
          child: Text('OK'),
        ),
      ],
    ),
  );

  if (name != null) {
    var url = Uri.http('localhost:3000', '/persoona');
    //var getPersonasUrl = Uri.http('$local_host:3000', '/getpersonas');
    try {
      // Send a POST request to create a persona
      var response = await http.post(
        url,
        headers: await makeHeader(),
        body: jsonEncode({'name': name}),
      );

      if (response.statusCode == 200) {
        print('Persona created successfully');
      } else {
        print('Failed to create persona: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

Future<List<PersonaCard>> fetchPersonaCards() async {
  var url = Uri.http('localhost:3000', 'getpersonacards');

  // var url = Uri.parse('http://your-go-server-ip:port/getpersonacards'); // Adjust the URL

  try {
    var response = await http.get(
      url,
      headers:await makeHeader(),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<PersonaCard> fetchedPersonaCards = [];
      for (var item in data['personas']) {
        fetchedPersonaCards.add(PersonaCard.fromJson(item));
      }
      return fetchedPersonaCards;
    } else {
      throw Exception(
          'Failed to fetch persona cards. Status code: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
