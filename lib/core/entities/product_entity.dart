import 'package:fruitify/core/entities/review_entity.dart';

class ProductEntity {
  final String productName;
  final double price;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final int calories;
  final int unit;
  num avgRating;
  num ratingCount;
  num amount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.productName,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.calories,
    required this.unit,
    required this.isOrganic,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.reviews,
    this.amount = 1,
  });
}
