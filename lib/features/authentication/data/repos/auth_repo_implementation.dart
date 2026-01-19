import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitify/core/errors/exceptions.dart';
import 'package:fruitify/core/errors/failures.dart';
import 'package:fruitify/core/services/database_service.dart';
import 'package:fruitify/features/authentication/data/models/user_model.dart';
import 'package:fruitify/features/authentication/domain/entities/user_entity.dart';
import 'package:fruitify/features/authentication/domain/repos/auth_repo.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/utils/backend_endpoints.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImplementation({
    required this.firebaseAuthService,
    required this.databaseService,
  });
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
      UserEntity userEntity = UserEntity(name: name, email: email, userID: user.uid);
      await addUser(
        user: userEntity,
      );
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(e.message));
    } catch (e) {
      if (user != null) {
        firebaseAuthService.deleteUser();
      }
      log(
        'Exception in AuthRepoImplementation.createUserWithEmailAndPassword: $e',
      );
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        emailAddress: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithEmailAndPassword: $e');
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithGoogle: $e');
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImplementation.signInWithFacebook: $e');
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }

  @override
  Future<dynamic> addUser({required UserEntity user}) async {
    databaseService.addData(
      path: BackendEndpoints.addUserData,
      data: user.toMap(),
    );
  }
}
