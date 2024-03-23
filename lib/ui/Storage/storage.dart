import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const storage = FlutterSecureStorage();
  static const eltoken = 'token';

  saveToken(String token) async {
    if (kDebugMode) {
      print("set eltoken: $token");
    }
    try {
      await storage.write(key: eltoken, value: token);
    } catch (e) {
      if (kDebugMode) {
        print("set eltoken Error: $e");
      }
    }
  }

  deleteToken() async {
    storage.delete(key: eltoken);
  }

  Future<String> getToken() async {
    try {
      String? token = await storage.read(key: eltoken);
      if (token != null) {
        return token;
      } else {
        throw Exception("no token found");
      }
    } catch (e) {
      rethrow;
    }
  }
}