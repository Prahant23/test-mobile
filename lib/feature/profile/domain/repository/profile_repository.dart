import 'package:dartz/dartz.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/feature/product/domain/entity/product_entity.dart';
import 'package:vintuff_thrift/feature/profile/domain/entity/profile_entity.dart';

abstract class IProfileRepository {
  Future<Either<Failure, bool>> getProfile(ProfileEntity product);
  Future<Either<Failure, bool>> createProfile();
}