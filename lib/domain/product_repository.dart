import 'package:bagpack/ui/screens/home_screen/data/product.dart';

class ProductRepository {
  Future<List<ProductCart>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    final mocProducts = [
      ProductCart(
        name: 'Тархун',
        description: 'Обычный',
        image:
            'https://vashnarkolog.com/wp-content/uploads/c/f/5/cf52a4a5cc40a04a752cea2296dac2b8.jpe',
      ),
      ProductCart(
        name: 'Швепс',
        description: 'Лимонный',
        image:
            'https://fry-meat.ru/upload/000/u11/1/2/shveps-limon-photo-big.jpg',
      ),
      ProductCart(
        name: 'Сок "Я"',
        description: 'Апельсиновый',
        image: 'https://bahetle-sib.ru/storage/goods/2018.jpg',
      ),
      ProductCart(
        name: 'Мажитель',
        description: 'Арбузный',
        image:
            'https://korzina.su/upload/iblock/1e1/1e188c15647e9063d4c95f1da3a6bdcc.jpg',
      ),
      ProductCart(
        name: 'Пепси кола',
        description: 'С сахаром',
        image:
            'https://sun1-99.userapi.com/s/v1/ig2/CnI5V9FimxXVUxrjoQifOCw5EUYRjObHlB4YoStn_jKgJa6bE5qH1dAF352VHc_wIsELBy-GpikWmA18BXlO58Ty.jpg?size=200x200&quality=96&crop=2,192,1198,1198&ava=1',
      ),
      ProductCart(
        name: 'Lipton',
        description: 'Персик',
        image:
            'https://mineral-group.com/wp-content/uploads/2023/08/lipton_persik_0.25_gb-1024x1024.jpg',
      ),
    ];
    final List<ProductCart> localProducts = [];
    final productList = localProducts + mocProducts;
    return productList;

    // throw Exception('ошибка');
  }

  Future<void> saveProduct(ProductCart productCart) async {}

  // Future<ProductCart> updateProduct() async {}
}
