import 'package:synchronized_scroll/data/category_model.dart';
import 'package:synchronized_scroll/data/product_model.dart';

class ListItem {
  const ListItem({
    this.category,
    this.product,
  });

  final CategoryModel category;
  final ProductModel product;

  bool get isCategory => category != null;
}