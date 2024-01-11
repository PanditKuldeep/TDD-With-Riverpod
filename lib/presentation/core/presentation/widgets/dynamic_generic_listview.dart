import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef ItemBuilder<T> = Widget Function(T item,int position);

class DynamicGenericListView<T> extends HookWidget {
  final Axis axis;
  final List<T> data;
  final int defaultSelectedIndex;
  final ItemBuilder<T> itemBuilder;

  const DynamicGenericListView({
    Key? key,
    required this.data,
    required this.itemBuilder,
    this.defaultSelectedIndex = 0,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: axis,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, position) {
        return itemBuilder(data[position],position);
      },
    );
  }
}
