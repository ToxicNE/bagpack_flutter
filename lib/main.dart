import 'package:bagpack/domain/product_repository.dart';
import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/ui/screens/authentication_screen/authentication_screen.dart';
import 'package:bagpack/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  await _registerSingleTons();

  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    if (getIt<UserRespository>().isAuth == false) {
      return MaterialApp(home: AuthenticationScreen());
    } else {
      return const MaterialApp(home: HomeScreen());
    }
  }
}

Future<void> _registerSingleTons() async {

  getIt.registerSingleton<UserRespository>(UserRespository());

  await getIt<UserRespository>().getIsUserAuth();
  
  getIt.registerSingleton<ProductRepository>(ProductRepository());
}
