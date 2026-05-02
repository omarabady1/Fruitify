import 'package:fruitify/core/entities/product_entity.dart';
import 'package:fruitify/core/errors/failures.dart';
import 'package:fruitify/core/models/product_model.dart';
import 'package:fruitify/core/repos/product_repo/product_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:fruitify/core/services/database_service.dart';
import 'package:fruitify/core/utils/backend_endpoints.dart';

class ProductRepoImplementation implements ProductRepo {
  final DatabaseService databaseService;
  ProductRepoImplementation({required this.databaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoints.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoints.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to load products'));
    }
  }
}
