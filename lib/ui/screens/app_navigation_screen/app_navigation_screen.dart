import 'package:bagpack/bloc/product_bloc/product_bloc.dart';
import 'package:bagpack/bloc/product_bloc/product_events.dart';
import 'package:bagpack/domain/product_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/navigation/navigation_model.dart';
import 'package:bagpack/ui/screens/home_screen/home_screen.dart';
import 'package:bagpack/ui/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatefulWidget {
  const AppNavigationScreen({super.key});

  @override
  State<AppNavigationScreen> createState() => _AppNavigationScreenState();
}

class _AppNavigationScreenState extends State<AppNavigationScreen> {
  @override
  void initState() {
    getIt.registerSingleton<ProductBloc>(
        ProductBloc(getIt<ProductRepository>())..add(LoadProducts()));
    super.initState();
  }

  int pageIndex = 0;

  List<AppNavigationModel> screens = [
    AppNavigationModel(
        pageName: 'Главная', id: 'home', page: const HomeScreen()),
    AppNavigationModel(
        pageName: 'Настройки', id: 'settings', page: const SettingsScreen()),
  ];

  void onNavItemTap(int index, BuildContext context) {
    setState(() {
      pageIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screens[pageIndex].pageName),
        centerTitle: true,
        elevation: 15,
        backgroundColor: Colors.deepPurple.shade400,
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            for (int i = 0; i < screens.length; i++) ...[
              ElevatedButton(
                  onPressed: () {
                    onNavItemTap(i, context);
                  },
                  child: Text(screens[i].pageName))
            ]
          ],
        ),
      ),
      body: screens[pageIndex].page,
    );
  }
}
