import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tdd_with_riverpod/presentation/features/products/presentation/components/products_component.dart';
import 'package:tdd_with_riverpod/presentation/features/products/presentation/notifiers/products_notifier.dart';

class ProductsPage extends HookConsumerWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(productsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.lightBlueAccent,
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          final productNotifier = ref.read(productsNotifierProvider.notifier);
          productNotifier.addProduct(
              product: 'Product ${productNotifier.productId}');
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: productList.isNotEmpty
          ? ProductsComponents(
              productList: productList,
              onRemoveProduct: (productId) {
                final productNotifier =
                    ref.read(productsNotifierProvider.notifier);
                productNotifier.removeProduct(productId: productId);
              },
            )
          : const Center(
              child: Text(
                'No Products Available',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
    );
  }
}
