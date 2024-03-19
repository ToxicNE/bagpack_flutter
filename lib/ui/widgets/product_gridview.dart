import 'package:bagpack/bloc/product_bloc/product_bloc.dart';
import 'package:bagpack/bloc/product_bloc/product_states.dart';
import 'package:bagpack/main.dart';
import 'package:bagpack/ui/widgets/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: getIt<ProductBloc>(),
      builder: (context, state) {
        if (state is ProductInitial) {
          return const SizedBox();
        }
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductErrorState) {
          return const Center(
            child: Text('something went wrong'),
          );
        }
        if (state is ProductLoadedState) {
          return Center(
            child: GridView.builder(
              itemCount: state.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 5,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                return CardWidget(product: state.products[index]);
              },
            ),
          );
        }
        return const Center(
          child: Text('something went wrong'),
        );
      },
    );
  }
}
