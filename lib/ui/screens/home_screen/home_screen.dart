import 'package:bagpack/bloc/product_bloc/product_bloc.dart';
import 'package:bagpack/bloc/product_bloc/product_events.dart';
import 'package:bagpack/domain/product_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/widgets/app_drawer.dart';
import 'package:bagpack/ui/widgets/product_gridview.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageController;
  String selectedPage = '';

  @override
  void initState() {
    getIt.registerSingleton<ProductBloc>(
        ProductBloc(getIt<ProductRepository>())..add(LoadProducts()));
    super.initState();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    _imageController = TextEditingController();
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return FutureBuilder(
          future: Future.delayed(const Duration(seconds: 2)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AlertDialog(
                content: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                    ),
                  ),
                ),
              );
            } else {
              return AlertDialog(
                title: const Text('Добавить новый продукт'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      TextField(
                        controller: _imageController,
                        decoration:
                            const InputDecoration(hintText: 'Ссылка на фото'),
                      ),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Название продукта'),
                      ),
                      TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                            hintText: 'Описание продукта'),
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Сохранить'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // TODO: Implement save functionality
                    },
                  ),
                ],
              );
            }
          },
        );
      },
    );
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
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple.shade400,
            foregroundColor: Colors.black,
            splashColor: Colors.deepPurple.shade300,
            tooltip: 'Добавить продукт',
            hoverElevation: 15,
            hoverColor: Colors.deepPurple.shade300,
            focusColor: Colors.deepPurple.shade300,
            elevation: 15,
            onPressed: () {
              _showDialog();
            },
            child: const Icon(Icons.add)));
  }
}
