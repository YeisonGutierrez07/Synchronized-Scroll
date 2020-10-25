import 'package:flutter/material.dart';
import 'package:synchronized_scroll/constants.dart';
import 'package:synchronized_scroll/data/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget(this.category);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: categoryHeight,
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: Text(
        category.name,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}