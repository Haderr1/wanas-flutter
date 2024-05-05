import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  late SharedPreferences _prefs;

  // Private constructor
  SharedPreferencesManager._();

  // Singleton instance getter
  static SharedPreferencesManager get instance {
    _instance ??= SharedPreferencesManager._();
    return _instance!;
  }

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  String getPersonaName() {
    return _prefs.getString('personaname') ?? '';
  }

  String getUserName() {
    return _prefs.getString('username') ?? '';
  }

  Future<void> savePersonaName(String Pname) async {
    await _prefs.setString('personaname', Pname);
  }

  Future<void> saveUserName(String name) async {
    await _prefs.setString('username', name);
  }

  Future<void> saveEmail(String email) async {
    await _prefs.setString('email', email);
  }

  String getEmail() {
    return _prefs.getString('email') ?? '';
  }



}


