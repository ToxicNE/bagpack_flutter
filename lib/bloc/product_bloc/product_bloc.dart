import 'package:bagpack/bloc/product_bloc/product_events.dart';
import 'package:bagpack/bloc/product_bloc/product_states.dart';
import 'package:bagpack/domain/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(
    this.productRepository,
  ) : super(ProductInitial()) {
    on<LoadProducts>(_loadProducts);
    on<AddProduct>(_addProduct);
  }

  ProductRepository productRepository;

  Future<void> _loadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());

    final products = await productRepository.getProducts();

    emit(ProductLoadedState(products));
  }

  Future<void> _addProduct(AddProduct event, Emitter<ProductState> emit) async {
    emit(ProductLoadingState());

    final products = await productRepository.getProducts();

    products.add(event.product);

    await productRepository.saveProduct(event.product);

    emit(ProductLoadedState(products));
  }
}
