import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 void showAlertDialogAddProduct() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder:(context) {
        return AlertDialog(
          title: const Text('Ты хочешь добавить продукт?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: Navigator.of(context).pop,
             child: Text('Хочу!', style: TextStyle(color: Colors.deepPurple.shade400, fontSize: 25),)
             ),
          ],
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
    elevation: 0,
    backgroundColor: Colors.deepPurple.shade400,
    foregroundColor: Colors.black,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.menu),
      color: Colors.black,
    ),
   ),

     body: const Center(
       child: SingleChildScrollView(
        child: Text("Содержимое экрана", style: TextStyle(fontSize: 25),) ,
       ),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
        //тут должна быть логика добавления продукта на выбор, либо из памяти, либо сфоткать сейчас
        return showAlertDialogAddProduct();
       },
       backgroundColor: Colors.deepPurple.shade400,
       foregroundColor: Colors.black,
       child: const Icon(Icons.add),
     ),
    );
  }
}