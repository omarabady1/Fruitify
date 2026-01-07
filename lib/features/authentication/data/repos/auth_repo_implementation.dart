import 'package:dartz/dartz.dart';
import 'package:fruitify/core/errors/failures.dart';
import 'package:fruitify/features/authentication/domain/entities/user_entity.dart';
import 'package:fruitify/features/authentication/domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo{
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
  

}