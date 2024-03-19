import 'dart:convert';

import 'package:bagpack/data/data_source/user_lds.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';

class UserRespository {
  UserRespository({
    required this.userLDS,
  });
  late bool isAuth;

  User? user;

  UserLDS userLDS;

  void getIsUserAuth() {
    final jsonUser = userLDS.getUser();
    if (jsonUser != null) {
      isAuth = true;
      user = User.fromJson(jsonDecode(jsonUser));
    } else {
      isAuth = false;
    }
  }

  Future<void> saveUser(User user) async {
    await userLDS.saveUser(jsonEncode(user.toJson()));
  }

  

  Future<void> deleteUser() async {
    await userLDS.deleteUser();
  }

  String? getUserName() {
    return UserLDS(storage: userLDS.storage).getUserName();
  }

Future<void> saveUserName (String name) async {
    await userLDS.saveUser(jsonEncode(User(name: name).toJson()));
  }

  String? getUserSurname() {
   return UserLDS(storage: userLDS.storage).getUserSurname();
  }

  Future<void> saveUserSurname(String surname) async {
    await userLDS.saveUser(jsonEncode(User(surname: surname).toJson()));
  }

  String? getUserEmail() {
    return UserLDS(storage: userLDS.storage).getUserEmail();
  }

  String? getUserPhoneNumber() {
    return UserLDS(storage: userLDS.storage).getUserPhoneNumber();
  }

  String? getUserProfileImage() {
    return UserLDS(storage: userLDS.storage).getUserProfileImage();
  }
}
