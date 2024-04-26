import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteUtility {
  //String _quote = 'Tap the button to get a random quote';

  static Future<String> getRandomQuote() async {
    final response =
        await http.get(Uri.parse('https://api.quotable.io/random'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['content'];
    } else {
      throw Exception('Failed to fetch quote');
    }
  }
}

// static Future<String> generateQuote() async {
// var url = Uri.parse("https://api.adviceslip.com/advice");
//
// var response = await http.get(url);
//
// if (response.statusCode == 200) {
// var result = jsonDecode(response.body);
// return result["slip"]["advice"];
// } else {
// throw Exception('Failed to fetch quote');
// }
// }}
