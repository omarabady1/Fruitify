
import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/errors/failures.dart';
import 'package:fruitify/core/repos/product_repo/product_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify/core/services/database_service.dart';

class ProductRepoImplementation implements ProductRepo {
final DatabaseService databaseService;
  ProductRepoImplementation({required this.databaseService});
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }


}