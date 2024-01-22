import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tdd_with_riverpod/core/presentation/extensions/list_extension.dart';
import 'package:tdd_with_riverpod/features/products/domain/entities/products.dart';

part 'products_notifier.g.dart';

@riverpod
class ProductsNotifier extends _$ProductsNotifier {
  late List<Products> productsList = [];
  int productId = 0;

  @override
  List<Products> build() => productsList;

  void addProduct({required String product}) {
    productsList.add(
      Products(id: productId += 1, productName: product),
    );
   state = productsList.toList();
  }

  void updateProduct({required int productId, required String productName}) {
    Products product =
        productsList.firstWhere((element) => element.id == productId);
    product.productName = productName;
    state = productsList.update(productId, product).toList();
  }

  void removeProduct({required int productId}) {
    productsList.removeWhere((element) => element.id == productId);
    state = productsList.toList();
  }
}
