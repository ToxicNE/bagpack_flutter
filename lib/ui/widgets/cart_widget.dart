import 'package:bagpack/ui/screens/home_screen/data/product.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.product});
  final ProductCart product;
  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.deepPurple.shade400,
      highlightColor: Colors.deepPurple.shade300,
      hoverColor: Colors.deepPurple.shade400,
      focusColor: Colors.deepPurple.shade400,
      onTap: () {},
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.5),
          ),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                    child: Column(children: [
                  Text(
                    widget.product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ])),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(widget.product.description,
                        textAlign: TextAlign.center, ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
