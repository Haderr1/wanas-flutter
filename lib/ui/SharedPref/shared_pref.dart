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

  // Get the saved name
  String getPersonaName() {
    return _prefs.getString('personaname') ?? '';
  }

  String getUserName() {
    return _prefs.getString('username') ?? '';
  }

  // Save the name
  Future<void> savePersonaName(String name) async {
    await _prefs.setString('personaname', name);
  }

  Future<void> saveUserName(String name) async {
    await _prefs.setString('username', name);
  }

}


