import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProductLDS {
SharedPreferences storage;
ProductLDS({required this.storage});
String key = 'product';

Future<void> saveProduct(Map<String, dynamic> json) async {
  await storage.setString(key, jsonEncode(json));
}

String? getProduct() {
  return storage.getString(key);
}

String? getProductName() {
  final json = jsonDecode(getProduct()!);
  return json['name'];
}

String? getProductDescription() {
  final json = jsonDecode(getProduct()!);
  return json['description'];
}

String? getProductImage() {
  final json = jsonDecode(getProduct()!);
  return json['image'];
}

Future<void> deleteProduct() async {
  await storage.remove(key);
}
}
