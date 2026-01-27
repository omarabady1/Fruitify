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
      UserEntity userEntity = UserEntity(
        name: name,
        email: email,
        userID: user.uid,
      );
      await addUser(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      deleteUser(user);
      log(
        'Exception in AuthRepoImplementation.createUserWithEmailAndPassword: $e',
      );
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }

  void deleteUser(User? user) {
    if (user != null) {
      firebaseAuthService.deleteUser();
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      await addUser(user: userEntity);
      return right(userEntity);
    } catch (e) {
      deleteUser(user);
      log('Exception in AuthRepoImplementation.signInWithGoogle: $e');
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      await addUser(user: userEntity);
      return right(userEntity);
    } catch (e) {
      deleteUser(user);
      log('Exception in AuthRepoImplementation.signInWithFacebook: $e');
      return left(ServerFailure('حدث خطأ ما، برجاء المحاولة لاحقًا'));
    }
  }

  @override
  Future<dynamic> addUser({required UserEntity user}) async {
    if (!await checkIfUserExists(user.userID)) {
      databaseService.addData(
        path: BackendEndpoints.addUserData,
        data: user.toMap(),
      );
    }
  }

  @override
  Future<bool> checkIfUserExists(String uid) async {
    return await databaseService.checkIfValueExist('users', 'userID', uid);
  }
}
