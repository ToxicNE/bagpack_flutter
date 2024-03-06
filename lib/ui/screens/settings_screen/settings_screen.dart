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
          // Фото профиля
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
          // Кнопка смены фото профиля
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Обработчик смены фото профиля
              },
              child: const Text("Сменить фото профиля"),
            ),
          ),
          // Переключатель темы
          SwitchListTile(
            title: const Text("Темная тема"),
            value: false, // Здесь должно быть состояние темы
            onChanged: (value) {
              // Обработчик изменения темы
            },
          ),
          // Поле редактирования имени
          ListTile(
            title: const Text("Имя"),
            subtitle: const Text("Ваше имя"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Обработчик редактирования имени
              },
            ),
          ),
          // Поле редактирования фамилии
          ListTile(
            title: const Text("Фамилия"),
            subtitle: const Text("Ваша фамилия"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Обработчик редактирования фамилии
              },
            ),
          ),
          // Поле редактирования email
          ListTile(
            title: const Text("Email"),
            subtitle: const Text("Ваш email"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Обработчик редактирования email
              },
            ),
          ),
          // Поле редактирования телефона
          ListTile(
            title: const Text("Телефон"),
            subtitle: const Text("Ваш номер телефона"),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Обработчик редактирования телефона
              },
            ),
          ),
          // Кнопка очистки памяти приложения
          ElevatedButton(
            onPressed: () {
              // Обработчик очистки памяти приложения
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
