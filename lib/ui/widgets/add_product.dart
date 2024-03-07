import 'package:flutter/material.dart';

class AddProductWidget extends StatefulWidget {
  const AddProductWidget({super.key});

  @override
  State<AddProductWidget> createState() => _AddProductWidgetState();
}

void showAlertDialogAddProduct(BuildContext context) async {
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
                style:
                    TextStyle(color: Colors.deepPurple.shade400, fontSize: 25),
              )),
        ],
      );
    },
  );
}

class _AddProductWidgetState extends State<AddProductWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //тут должeн  быть список добавления продуктов на выбор, либо из памяти, либо сфоткать сейчас
        return showAlertDialogAddProduct(context);
      },
      backgroundColor: Colors.deepPurple.shade400,
      foregroundColor: Colors.black,
      tooltip: 'Добавить продукт',
      elevation: 5,
      shape: const CircleBorder(),
      splashColor: Colors.deepPurple.shade300,
      child: const Icon(Icons.add),
    );
  }
}
