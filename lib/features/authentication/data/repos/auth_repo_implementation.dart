import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitify/core/errors/exceptions.dart';
import 'package:fruitify/core/errors/failures.dart';
import 'package:fruitify/features/authentication/data/models/user_model.dart';
import 'package:fruitify/features/authentication/domain/entities/user_entity.dart';
import 'package:fruitify/features/authentication/domain/repos/auth_repo.dart';

import '../../../../core/services/firebase_auth_service.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImplementation(this.firebaseAuthService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImplementation.createUserWithEmailAndPassword: $e',
      );
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }
}
