// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vintuff_thrift/core/failure/failure.dart';
// import 'package:vintuff_thrift/feature/product/data/data_source/product_remote_datasource.dart';
// import 'package:vintuff_thrift/feature/product/domain/entity/product_entity.dart';
// import 'package:vintuff_thrift/feature/product/domain/repository/product_repository.dart';

// final productRemoteRepoProvider = Provider<IProductRepository>(
//   (ref) => ProductRemoteRepository(
//     productRemoteDataSource: ref.read(productRemoteDataSourceProvider),
//   ),
// );

// class ProductRemoteRepository implements IProductRepository {
//   final ProductRemoteDataSource productRemoteDataSource;

//   ProductRemoteRepository({required this.productRemoteDataSource});

//   @override
//   Future<Either<Failure, List<ProductEntity>>> searchProducts(
//       String searchText) {
//     return productRemoteDataSource.searchProducts(searchText);
//   }
// }
