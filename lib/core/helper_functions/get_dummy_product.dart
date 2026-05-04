import 'package:fruitify/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    productName: 'فراولة',
    price: 30,
    amount: 2,
    code: '0000',
    description: 'فاكهة طازجة',
    isFeatured: false,
    expirationMonths: 1,
    calories: 50,
    unit: 1,
    isOrganic: false,
    reviews: [],
    imageUrl: 'https://lfqwkciqqbwsrwblhrfr.supabase.co/storage/v1/object/public/images/images33.jpg'
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(6, (_) => getDummyProduct());
}
