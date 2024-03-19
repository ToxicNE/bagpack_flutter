import 'package:bagpack/bloc/product_bloc/product_bloc.dart';
import 'package:bagpack/bloc/product_bloc/product_events.dart';
import 'package:bagpack/domain/product_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/widgets/add_product.dart';
import 'package:bagpack/ui/widgets/app_drawer.dart';
import 'package:bagpack/ui/widgets/product_gridview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPage = '';

  @override
  void initState() {
    getIt.registerSingleton<ProductBloc>(ProductBloc(getIt<ProductRepository>())..add(LoadProducts()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Главная"),
        centerTitle: true,
        elevation: 15,
        backgroundColor: Colors.deepPurple.shade400,
        foregroundColor: Colors.black,
      ),
      drawer: const AppDrawer(),
      body: const ProductGridView(),
      floatingActionButton: const AddProductWidget(),
    );
  }
}
