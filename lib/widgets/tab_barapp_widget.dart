import 'package:flutter/material.dart';
import 'package:synchronized_scroll/constants.dart';
import 'package:synchronized_scroll/data/tab_category_model.dart';

class TabBarAppWidget extends StatelessWidget {
  const TabBarAppWidget(this.tabCategory);

  final TabCategory tabCategory;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: tabCategory.selected ? 1 : 0.5,
      child: Card(
        elevation: tabCategory.selected ? 6 : 0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            tabCategory.category.name,
            style: TextStyle(
              color: blueColor,
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
            ),
          ),
        ),
      ),
    );
  }
}