import 'package:bagpack/ui/widgets/product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPage = '';

  List <ProductCart> products = [
    ProductCart(
      name: 'Product 1',
      description: 'Description',
      image: 'https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg',
    ),
    ProductCart(
      name: 'Product 2',
      description: 'Description',
      image: 'https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg',
    ),
    ProductCart(
      name: 'Product 3',
      description: 'Description',
      image: 'https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg',
    ),
    ProductCart(
      name: 'Product 4',
      description: 'Description',
      image: 'https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg',
    ),
    ProductCart(
      name: 'Product 5',
      description: 'Description',
      image: 'https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg',
    ),
    ProductCart(
      name: 'Product 6',
      description: 'Description',
      image: 'https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg',
    ),
  ];

  void showAlertDialogAddProduct() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ты хочешь добавить продукт?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: Navigator.of(context).pop,
                child: Text(
                  'Хочу!',
                  style: TextStyle(
                      color: Colors.deepPurple.shade400, fontSize: 25),
                )),
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
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:NetworkImage('https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg'),
                )
              ),
              child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
              padding:  EdgeInsets.only(bottom: 16.0, left: 16.0),
              child: Text(
                'Имя пользователя',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              ),
              ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_rounded),
              title: const Text('Главная', style: TextStyle(fontSize: 25)),
              onTap: () {
                setState(() {
                  selectedPage = 'Главная';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Настройки', style: TextStyle(fontSize: 25)),
              onTap: () {
                setState(() {
                  selectedPage = 'Настройки';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 5,
            childAspectRatio: 2.5,
          
          ), 
          itemBuilder: (context, index) {
            return GridTile(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.5),
                  
                ),
              )
            );
          },
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //тут должeн  быть список добавления продуктов на выбор, либо из памяти, либо сфоткать сейчас
          return showAlertDialogAddProduct();
        },
        backgroundColor: Colors.deepPurple.shade400,
        foregroundColor: Colors.black,
        tooltip: 'Добавить продукт',
        elevation: 5,
        shape: const CircleBorder(),
        splashColor: Colors.deepPurple.shade300,
        child: const Icon(Icons.add),
      ),
    );
  }
}
