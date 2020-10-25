
import 'package:flutter/material.dart';
import 'package:synchronized_scroll/data/category_model.dart';

class TabCategory {
  const TabCategory({
    @required this.category,
    @required this.selected,
    @required this.offSetFrom,
    @required this.offSetTo,
  });

  TabCategory coppyWith(bool selected) => TabCategory(
        category: category,
        selected: selected,
        offSetFrom: offSetFrom,
        offSetTo: offSetTo,
      );

  final CategoryModel category;
  final bool selected;
  final double offSetFrom;
  final double offSetTo;
}