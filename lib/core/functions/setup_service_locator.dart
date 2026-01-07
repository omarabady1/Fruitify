import 'package:fruitify/core/services/firebase_auth_service.dart';
import 'package:fruitify/features/authentication/data/repos/auth_repo_implementation.dart';
import 'package:get_it/get_it.dart';
import '../../features/authentication/domain/repos/auth_repo.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  locator.registerSingleton<AuthRepo>(
    AuthRepoImplementation(locator<FirebaseAuthService>()),
  );
}
