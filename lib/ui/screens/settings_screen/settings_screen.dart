import 'package:bagpack/bloc/product_bloc/product_bloc.dart';
import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/screens/authentication_screen/authentication_screen.dart';
import 'package:bagpack/ui/screens/change_user_profile_image.dart';
import 'package:flutter/material.dart';

import '../authentication_screen/data/user_model.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

bool isDarkTheme = false;

class SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _inputNameController = TextEditingController();
  final TextEditingController _inputSurnameController = TextEditingController();
  final TextEditingController _inputPhoneController = TextEditingController();
  final TextEditingController _inputEmailController = TextEditingController();

  bool showProfileImageTextField = false;
  bool showNameTextField = false;
  bool showSurnameTextField = false;
  bool showPhoneTextField = false;
  bool showEmailTextField = false;

  void _onChangeNameStateTap() {
    setState(() {
      showNameTextField = !showNameTextField;
    });
  }

  void _onChangeSurnameStateTap() {
    setState(() {
      showSurnameTextField = !showSurnameTextField;
    });
  }

  void _onChangePhoneStateTap() {
    setState(() {
      showPhoneTextField = !showPhoneTextField;
    });
  }

  void _onChangeEmailStateTap() {
    setState(() {
      showEmailTextField = !showEmailTextField;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
          valueListenable: getIt<UserRespository>().userNotifier,
          builder: (context, value, child) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                       'https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ChangeUserProfileScreen(),
                      ));
                    },
                    child: const Text("Сменить фото профиля"),
                  ),
                ),
                SwitchListTile(
                  title: const Text("Темная тема"),
                  value: isDarkTheme,
                  onChanged: (value) {
                    setState(() {
                      isDarkTheme = value;
                    });
                  },
                ),
                if (showNameTextField)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: value?.name ?? "Ваше имя",
                          ),
                          keyboardType: TextInputType.name,
                          autocorrect: true,
                          controller: _inputNameController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          _onChangeNameStateTap();
                          User newUser =
                              getIt<UserRespository>().userNotifier.value!;
                          newUser.name = _inputNameController.text;
                          getIt<UserRespository>().saveUser(newUser);
                        },
                      )
                    ],
                  )
                else
                  ListTile(
                    title: Text(value?.name ?? "Ваше имя"),
                    subtitle: const Text("Ваше имя"),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        setState(() {
                          _onChangeNameStateTap();
                        });
                      },
                    ),
                  ),
                if (showSurnameTextField)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: value?.surname ?? "Ваша фамилия",
                          ),
                          keyboardType: TextInputType.name,
                          autocorrect: true,
                          controller: _inputSurnameController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          _onChangeSurnameStateTap();
                          User newUser =
                              getIt<UserRespository>().userNotifier.value!;
                          newUser.surname = _inputSurnameController.text;
                          getIt<UserRespository>().saveUser(newUser);
                        },
                      )
                    ],
                  )
                else
                  ListTile(
                    title: Text(value?.surname ?? "Ваша фамилия"),
                    subtitle: const Text("Ваша фамилия"),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        setState(() {
                          _onChangeSurnameStateTap();
                        });
                      },
                    ),
                  ),
                if (showPhoneTextField)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText:
                                value?.phoneNumber ?? "Ваш номер телефона",
                          ),
                          keyboardType: TextInputType.phone,
                          autocorrect: true,
                          controller: _inputPhoneController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          _onChangePhoneStateTap();
                          User newUser =
                              getIt<UserRespository>().userNotifier.value!;
                          newUser.phoneNumber = _inputPhoneController.text;
                          getIt<UserRespository>().saveUser(newUser);
                        },
                      )
                    ],
                  )
                else
                  ListTile(
                    title: Text(value?.phoneNumber ?? "Ваш номер телефона"),
                    subtitle: const Text("Ваш номер телефона"),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        setState(() {
                          _onChangePhoneStateTap();
                        });
                      },
                    ),
                  ),
                if (showEmailTextField)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: value?.email ?? "Ваша почта",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: true,
                          controller: _inputEmailController,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () {
                          _onChangeEmailStateTap();
                          User newUser =
                              getIt<UserRespository>().userNotifier.value!;
                          newUser.email = _inputEmailController.text;
                          getIt<UserRespository>().saveUser(newUser);
                        },
                      )
                    ],
                  )
                else
                  ListTile(
                    title: Text(value?.email ?? "Ваша почта"),
                    subtitle: const Text("Ваша почта"),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async {
                        setState(() {
                          _onChangeEmailStateTap();
                        });
                      },
                    ),
                  ),
                ElevatedButton(
                  onPressed: () {
                    getIt.unregister<ProductBloc>(
                        instance: getIt<ProductBloc>());

                    getIt<UserRespository>().deleteUser();

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AuthenticationScreen(),
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.deepPurple.shade400,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.all(16.0),
                    elevation: 15,
                    shadowColor: Colors.deepPurple.shade400,
                    textStyle: const TextStyle(fontSize: 15),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text("Очистить память"),
                ),
              ],
            );
          },
        ));
  }
}
