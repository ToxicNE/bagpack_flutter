// ignore_for_file: use_build_context_synchronously

import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';
import 'package:flutter/material.dart';

class InputUpdateEmail extends StatefulWidget {
  InputUpdateEmail({super.key});
  final TextEditingController _emailController = TextEditingController();

  @override
  State<InputUpdateEmail> createState() => _InputUpdateEmailState();
}

class _InputUpdateEmailState extends State<InputUpdateEmail> {
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
                controller: widget._emailController,
                decoration: const InputDecoration(
                  labelText: 'email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (getIt<UserRespository>().isAuth == false) {
                    getIt<UserRespository>().isAuth = true;
                  }
                  user.email = widget._emailController.text;
                  await getIt<UserRespository>().saveUser(user);
                  Navigator.of(context).pop();
                },
                child: const Text('Сохранить'),
              ),
            ])),
          ),
        ]);
  }
}
