import 'package:shared_preferences/shared_preferences.dart';

class UserLDS {
  SharedPreferences storage;
  UserLDS({required this.storage});
  String key = "user";
  Future<void> saveUser(String json) async {
    await storage.setString(key, json);
  }

  String? getUser() {
    return storage.getString(key);
  }

  Future<void> deleteUser() async {
    await storage.remove(key);
  }
} 
