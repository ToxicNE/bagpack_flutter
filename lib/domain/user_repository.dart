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
    final  jsonUser = userLDS.getUser();
    if(jsonUser!= null){
      isAuth = true;
      user = User.fromJson(jsonDecode(jsonUser));
    }else{
      isAuth = false;
    }
  }

  Future<void> saveUser (User user) async {
    await userLDS.saveUser(jsonEncode(user.toJson()));
  }
}
