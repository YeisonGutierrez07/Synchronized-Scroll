

import 'package:flutter/material.dart';

class ProductModel {
  const ProductModel({
    @required this.name,
    @required this.description,
    @required this.price,
    @required this.image,
  });

  final String name;
  final String description;
  final double price;
  final String image;
}