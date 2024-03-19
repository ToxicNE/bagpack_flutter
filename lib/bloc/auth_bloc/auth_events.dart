abstract class AuthEvent {}

class LoadUser extends AuthEvent {}

class LogOut extends AuthEvent {}

class LogIn extends AuthEvent {
  final String email;
  final String password;
  LogIn(this.email, this.password);
}