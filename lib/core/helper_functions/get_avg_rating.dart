import 'package:fruitify/core/models/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) {
    return 0;
  }

  return reviews.map((review) => review.rating).reduce((a, b) => a + b) /
      reviews.length;
}