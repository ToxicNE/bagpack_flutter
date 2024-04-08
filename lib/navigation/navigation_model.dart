import 'package:flutter/material.dart';

class AppNavigationModel {
  AppNavigationModel({
    required this.pageName,
    required this.id,
    required this.page,
  });
  String pageName;
  String id;
  Widget page;
}
