// ignore_for_file: use_build_context_synchronously

import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';
import 'package:flutter/material.dart';

class InputUpdateName extends StatefulWidget {
  InputUpdateName({super.key});
  final TextEditingController _nameController = TextEditingController();

  @override
  State<InputUpdateName> createState() => _InputUpdateNameState();
}

class _InputUpdateNameState extends State<InputUpdateName> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
                borderRadius: BorderRadius.circular(20.0),
                child: Column(children: [
              TextField(
                controller: widget._nameController,
                decoration: const InputDecoration(
                  labelText: 'Имя',
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (getIt<UserRespository>().isAuth == false) {
                    getIt<UserRespository>().isAuth = true;
                  }
                  user.name = widget._nameController.text;
                  await getIt<UserRespository>().saveUserName(user.name.toString());
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'),
              ),
            ])),
          ),
        ]);
  }
}
