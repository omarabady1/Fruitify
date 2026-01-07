import 'package:dartz/dartz.dart';
import 'package:fruitify/core/errors/failures.dart';
import 'package:fruitify/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  );
}
