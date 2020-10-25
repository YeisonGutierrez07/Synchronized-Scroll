import 'package:flutter/material.dart';
import 'package:synchronized_scroll/data/product_model.dart';

class CategoryModel {
  const CategoryModel({
    @required this.name,
    @required this.products,
  });

  final String name;
  final List<ProductModel> products;
}