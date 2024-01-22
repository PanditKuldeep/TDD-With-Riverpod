class Products {
  final int id;
  String productName;
  bool isSelected;

  Products(
      {required this.id, required this.productName, this.isSelected = false});
}
