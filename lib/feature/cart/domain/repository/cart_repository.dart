import 'package:dartz/dartz.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/feature/cart/domain/entity/cart_entity.dart';
import 'package:vintuff_thrift/feature/product/domain/entity/product_entity.dart';

abstract class ICartRepository {
  Future<Either<Failure, bool>> getcart(CartEntity cart);
  Future<Either<Failure, bool>> createcart(CartEntity cart);
}