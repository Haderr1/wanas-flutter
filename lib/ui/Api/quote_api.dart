import 'dart:convert';
import 'package:http/http.dart' as http;



class QuoteUtility {
  static const String quoteURL = "https://api.adviceslip.com/advice";

  static Future<String> generateQuote() async {
    var res = await http.get(Uri.parse(quoteURL));
    var result = jsonDecode(res.body);
    return result["slip"]["advice"];
  }
}