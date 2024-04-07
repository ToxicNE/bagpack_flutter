// ignore_for_file: use_build_context_synchronously

import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  AuthenticationScreen({super.key});

  Future<void> auth(BuildContext context) async {
    User user = User(name: _nameController.text, phoneNumber: _phoneController.text);

    await getIt<UserRespository>().saveUser(user);

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const App(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аутентификация'),
        centerTitle: true,
        leading: const Icon(Icons.person),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Имя',
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              // obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Номер телефона',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => auth(context),
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
