import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/ui/screens/authentication_screen/authentication_screen.dart';
import 'package:bagpack/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (isAuth == false) {
      return MaterialApp(home: AuthenticationScreen());
    } else {
      return const MaterialApp(home: HomeScreen());
    }
  }
}
