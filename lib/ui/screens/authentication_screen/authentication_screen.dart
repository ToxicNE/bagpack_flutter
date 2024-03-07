import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аутентификация'),
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
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              // obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Номер телефона',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (isAuth == false) {
                  isAuth = true;
                }

                user.name = _nameController.text;
                user.phoneNumber = _phoneController.text;

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const App(),
                  ),
                );
              },
              child: const Text('Войти'),
            ),
          ],
        ),
      ),
    );
  }
}
