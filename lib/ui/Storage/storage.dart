// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class TokenStorage {
//   static const FlutterSecureStorage storage = FlutterSecureStorage();
//
//   Future<void> saveToken(String token) async {
//     await storage.write(key: 'token', value: token);
//   }
//
//   Future<String?> getToken() async {
//     return await storage.read(key: 'token');
//   }
// }
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const storage = FlutterSecureStorage();
  static const eltoken = 'token';

  saveToken(String token) async {
    print("set eltoken: $token");
    try {
      await storage.write(key: eltoken, value: token);
    } catch (e) {
      print("set eltoken Error: $e");
    }
  }

  deletetoken() async {
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