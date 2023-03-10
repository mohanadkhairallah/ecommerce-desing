import 'package:ecomm_design/models/product_color.dart';
import 'package:ecomm_design/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final String image;
  final String desc;
  final String price;
  final String oldPrice;
  final List<ProductColor>? productColors;

  ProductModel({
    required this.name,
    required this.desc,
    required this.image,
    required this.price,
    required this.oldPrice,
    this.productColors,
  });
}

class DummyProducts {
  static final ProductModel dummyProduct1 = ProductModel(
      name: 'Baon',
      desc: 'Original PullOver',
      image: ImageManager.product1,
      price: '39.5',
      oldPrice: '50.5',
      productColors: [
        ProductColor(
          color: Colors.red,
          image: ImageManager.product1,
        ),
        ProductColor(
          color: Colors.green,
          image: ImageManager.product2,
        ),
        ProductColor(
          color: Colors.yellow,
          image: ImageManager.product3,
        ),
        ProductColor(
          color: Colors.black,
          image: ImageManager.product4,
        ),
        ProductColor(
          color: Colors.blue,
          image: ImageManager.product5,
        ),
      ]);

  static final ProductModel dummyProduct2 = ProductModel(
    name: 'Levi\'s',
    desc: 'Original',
    image: ImageManager.product2,
    price: '40.5',
    oldPrice: '55.5',
  );

  static final ProductModel dummyProduct3 = ProductModel(
    name: 'Helly',
    desc: 'Original PullOver',
    image: ImageManager.product3,
    price: '37.5',
    oldPrice: '80.5',
  );

  static final List<ProductModel> dummyList = [
    dummyProduct1,
    dummyProduct2,
    dummyProduct3,
    dummyProduct1,
    dummyProduct2,
    dummyProduct3,
    dummyProduct1,
    dummyProduct2,
    dummyProduct3,
    dummyProduct1,
    dummyProduct2,
    dummyProduct3,
    dummyProduct1,
    dummyProduct2,
    dummyProduct3,
  ];
}
