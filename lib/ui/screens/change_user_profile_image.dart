import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/user_model.dart';
import 'package:flutter/material.dart';

class ChangeUserProfileScreen extends StatefulWidget {
  const ChangeUserProfileScreen({super.key});

  @override
  State<ChangeUserProfileScreen> createState() =>
      _ChangeUserProfileScreenState();
}

class _ChangeUserProfileScreenState extends State<ChangeUserProfileScreen> {
  final TextEditingController _inputProfileImageController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'URL изображения профиля',
            ),
            keyboardType: TextInputType.url,
            controller: _inputProfileImageController,
          ),
          IconButton(
            onPressed: () {
              User newUser = getIt<UserRespository>().userNotifier.value!;
              newUser.profileImage = _inputProfileImageController.text;
              getIt<UserRespository>().saveUser(newUser);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.check),
          )
        ]));
  }
}
