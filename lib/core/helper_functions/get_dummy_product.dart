import 'package:fruitify/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    productName: 'فراولة',
    price: '30',
    code: '0000',
    description: 'فاكهة طازجة',
    isFeatured: false,
    expirationMonths: 1,
    calories: 50,
    unit: 1,
    isOrganic: false,
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(6, (_) => getDummyProduct());
}
