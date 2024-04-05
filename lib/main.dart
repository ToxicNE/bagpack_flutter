import 'package:bagpack/data/data_source/user_lds.dart';
import 'package:bagpack/domain/product_repository.dart';
import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/ui/screens/authentication_screen/authentication_screen.dart';
import 'package:bagpack/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> main() async {
  runApp(const MaterialApp(home: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initDependecies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (getIt<UserRespository>().isAuth == false) {
              return MaterialApp(home: AuthenticationScreen());
            } else {
              return const MaterialApp(home: HomeScreen());
            }
          }

          //TODO() Вставить загрузку

          return const SizedBox(
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}

Future<void> _initDependecies() async {
  final storage = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(storage);
  getIt.registerSingleton<UserRespository>(UserRespository(userLDS: UserLDS(storage: storage)));

  getIt<UserRespository>();

  getIt.registerSingleton<ProductRepository>(ProductRepository());
}
