import 'package:bagpack/ui/screens/home_screen/home_screen.dart';
import 'package:bagpack/ui/widgets/cart_widget.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        childAspectRatio: 2.5,
      ),
      itemBuilder: (context, index) {
        return CartWidget(product: products[index]);
      },
    ));
  }
}
