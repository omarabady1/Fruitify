import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/helper_functions/get_avg_rating.dart';
import 'package:fruitify/core/models/review_model.dart';

class ProductModel {
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
  num amount;
  num avgRating;
  num ratingCount;
  int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.productName,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationMonths,
    required this.calories,
    required this.unit,
    this.amount = 1,
    required this.isOrganic,
    required this.avgRating,
    this.ratingCount = 0,
    required this.sellingCount,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ReviewModel> reviews = [];
    if (json['reviews'] != null && json['reviews'] is List) {
      reviews = (json['reviews'] as List)
          .map((review) => ReviewModel.fromJson(review))
          .toList()
          .cast<ReviewModel>();
    }
    return ProductModel(
      productName: json['productName'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationMonths: json['expirationMonths'],
      calories: json['calories'],
      unit: json['unit'],
      amount: json['amount'],
      isOrganic: json['isOrganic'],
      avgRating: getAvgRating(reviews),
      ratingCount: json['ratingCount'],
      sellingCount: json['sellingCount'],
      reviews: reviews,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productName: productName,
      price: price,
      code: code,
      description: description,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationMonths: expirationMonths,
      calories: calories,
      unit: unit,
      amount: amount,
      isOrganic: isOrganic,
      avgRating: avgRating,
      ratingCount: ratingCount,
      reviews: reviews.map((review) => review.toEntity()).toList(),
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
    'amount': amount,
    'isOrganic': isOrganic,
    'avgRating': avgRating,
    'ratingCount': ratingCount,
    'sellingCount': sellingCount,
    'reviews': reviews.map((review) => review.toJson()).toList(),
  };
}
