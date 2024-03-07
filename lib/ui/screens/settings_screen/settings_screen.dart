import 'package:bagpack/domain/user_repository.dart';
import 'package:bagpack/ui/screens/authentication_screen/authentication_screen.dart';
import 'package:bagpack/ui/screens/authentication_screen/data/users.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Настройки"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple.shade400,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                "https://www.wmj.ru/imgs/2020/10/23/18/4300765/75ca401ba4ef59c4222c54c26ac7cc22d032b145.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Сменить фото профиля"),
            ),
          ),
          SwitchListTile(
            title: const Text("Темная тема"),
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            title: Text(users[0].name),
            subtitle: const Text("Ваше имя"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: Text("${users[0].surname}"),
            subtitle: const Text("Ваша фамилия"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          ListTile(
            title: Text("${users[0].email}"),
            subtitle: const Text("Ваш email"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          // Поле редактирования телефона
          ListTile(
            title: Text("${users[0].phoneNumber}"),
            subtitle: const Text("Ваш номер телефона"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => AuthenticationScreen(),
              ));
              isAuth = false;
              users[0].name = '';
              users[0].surname = '';
              users[0].email = '';
              users[0].phoneNumber = '';
              users[0].profileImage = '';
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple.shade400,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.all(16.0),
              elevation: 15,
              shadowColor: Colors.deepPurple.shade400,
              minimumSize: const Size.fromHeight(50),
              maximumSize: const Size.fromHeight(50),
              textStyle: const TextStyle(fontSize: 15),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text("Очистить память"),
          ),
        ],
      ),
    );
  }
}
