// ignore_for_file: use_build_context_synchronously

import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';
import 'package:flutter/material.dart';

class InputUpdatePhoneNumber extends StatefulWidget {
  InputUpdatePhoneNumber({super.key});
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  State<InputUpdatePhoneNumber> createState() => _InputUpdatePhoneNumberState();
}

class _InputUpdatePhoneNumberState extends State<InputUpdatePhoneNumber> {
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
                controller: widget._phoneNumberController,
                decoration: const InputDecoration(
                  labelText: 'номер телефона',
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (getIt<UserRespository>().isAuth == false) {
                    getIt<UserRespository>().isAuth = true;
                  }
                  user.phoneNumber = widget._phoneNumberController.text;
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
