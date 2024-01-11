
import 'package:dartz/dartz.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/feature/auth/domain/entity/auth_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser(AuthEntity user);
  Future<Either<Failure, bool>> loginUser(String email, String password);
}
