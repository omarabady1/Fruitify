import 'package:fruitify/core/repos/product_repo/product_repo.dart';
import 'package:fruitify/core/repos/product_repo/product_repo_implementation.dart';
import 'package:fruitify/core/services/firebase_auth_service.dart';
import 'package:fruitify/features/authentication/data/repos/auth_repo_implementation.dart';
import 'package:get_it/get_it.dart';
import '../../features/authentication/domain/repos/auth_repo.dart';
import '../services/database_service.dart';
import '../services/firestore_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImplementation(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImplementation(databaseService: getIt<DatabaseService>()),
  );
}
