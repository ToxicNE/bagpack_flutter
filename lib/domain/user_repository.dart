class UserRespository {
  late bool isAuth;

  Future<void> getIsUserAuth() async {
    isAuth = true;
  }
}
