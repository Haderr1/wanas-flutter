import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waanaass/ui/Constants/appConstants.dart';
import 'Api.dart';



Future<String> sendMessage(String message,int personaId,int chatId, ) async {
  var url = Uri.http(appConstants.LOCAL_HOST, '/persona/$personaId/chat/$chatId');

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

    throw Exception('Failed to send message: $e');
  }
}