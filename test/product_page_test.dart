import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_with_riverpod/presentation/features/products/presentation/notifiers/products_notifier.dart';

void main() {
  late ProductsNotifier productsNotifier;

  setUp(() {
    productsNotifier = ProductsNotifier();
  });

  test('add product', () {
    productsNotifier.addProduct(product: 'foo');
    expect(productsNotifier.productsList.length, 1);
    expect(productsNotifier.productsList.first.id, 1);
    expect(productsNotifier.productsList.first.productName, 'foo');
  });

  test('update product', () {
    /// add a new products
    productsNotifier.addProduct(product: 'product one');
    productsNotifier.addProduct(product: 'product two');
    productsNotifier.addProduct(product: 'product three');
    expect(productsNotifier.productsList.length, 3);

    /// update the product
    productsNotifier.updateProduct(productId: 3, productName: 'product four');
    expect(productsNotifier.productsList[2].id, 3);
    expect(productsNotifier.productsList[2].productName, 'product four');
  });

  test('remove product', () {
    /// add a new products
    productsNotifier.addProduct(product: 'product one');
    productsNotifier.addProduct(product: 'product two');
    expect(productsNotifier.productsList.length, 2);

    /// remove a new product
    productsNotifier.removeProduct(productId: 1);
    expect(productsNotifier.productsList.length, 1);
    expect(productsNotifier.productsList.first.id, 2);
  });
}
