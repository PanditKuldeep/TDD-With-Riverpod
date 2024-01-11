import 'package:flutter/material.dart';
import 'package:tdd_with_riverpod/domain/models/products.dart';
import 'package:tdd_with_riverpod/presentation/core/presentation/widgets/dynamic_generic_listview.dart';

class ProductsComponents extends StatelessWidget {
  final List<Products> productList;
  final Function(int) onRemoveProduct;

  const ProductsComponents(
      {Key? key, required this.productList, required this.onRemoveProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicGenericListView<Products>(
      axis: Axis.vertical,
      data: productList,
      itemBuilder: (item, index) {
        final product = productList[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: ListTile(
                title: Text(product.productName),
                trailing: GestureDetector(
                  onTap: () => onRemoveProduct.call(product.id),
                  child: const Icon(Icons.delete),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }
}
