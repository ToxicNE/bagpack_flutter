import 'package:bagpack/ui/screens/home_screen/data/product.dart';

abstract class ProductEvent {}

class LoadProducts extends ProductEvent {}

class AddProduct extends ProductEvent {
  final ProductCart product;
  AddProduct(this.product);
}
