import 'package:bagpack/ui/screens/home_screen/data/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  ProductLoadedState(this.products);
  final List<ProductCart> products;
}

class ProductErrorState extends ProductState {
  ProductErrorState(this.error);
  final String error;
}
