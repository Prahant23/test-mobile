import 'package:dartz/dartz.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/feature/product/domain/entity/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, bool>> getProduct(ProductEntity product);
  Future<Either<Failure, bool>> createProduct();
  Future<Either<Failure, bool>> searchproducts();

}