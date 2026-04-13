import 'dart:io';
import 'package:fruitify/core/models/review_model.dart';

class ProductModel {
  final String productName;
  final String price;
  final String code;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int calories;
  final int unit;
  num avgRating;
  num ratingCount;
  int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.productName,
    required this.price,
    required this.code,
    required this.description,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.calories,
    required this.unit,
    required this.isOrganic,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.sellingCount,
    required this.reviews,
  });
 
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      image: json['image'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationMonths: json['expirationMonths'],
      calories: json['calories'],
      unit: json['unit'],
      isOrganic: json['isOrganic'],
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews']
          .map((review) => ReviewModel.fromJson(review))
          .toList(),
    );
  }

  dynamic toJson() => {
    'productName': productName,
    'price': price,
    'code': code,
    'description': description,
    'isFeatured': isFeatured,
    'imageUrl': imageUrl,
    'expirationMonths': expirationMonths,
    'calories': calories,
    'unit': unit,
    'isOrganic': isOrganic,
    'avgRating': avgRating,
    'ratingCount': ratingCount,
    'sellingCount': sellingCount,
    'reviews': reviews.map((review) => review.toJson()).toList(),
  };
}
