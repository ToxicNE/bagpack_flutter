import 'dart:convert';

import 'package:bagpack/data/data_source/user_lds.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';
import 'package:flutter/foundation.dart';

class UserRespository {
  UserRespository({
    required this.userLDS,
  }) {
    _initUserNotifier();
  }

  ValueNotifier<User?> userNotifier = ValueNotifier<User?>(null);

  UserLDS userLDS;

  void _initUserNotifier() {
    final jsonUser = userLDS.getUser();

    if (jsonUser == null) {
      userNotifier.value = null;
      return;
    }

    userNotifier.value = User.fromJson(jsonDecode(jsonUser));
  }

  Future<void> saveUser(User newUser) async {
    await userLDS.saveUser(jsonEncode(newUser.toJson()));
  }

  Future<void> deleteUser() async {
    await userLDS.deleteUser();
  }
}
