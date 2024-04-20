import 'dart:convert';
import 'package:http/http.dart' as http;



class QuoteUtility {
  static Future<String> generateQuote() async {
    var url = Uri.parse("https://api.adviceslip.com/advice");

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result["slip"]["advice"];
    } else {
      throw Exception('Failed to fetch quote');
    }
}}


