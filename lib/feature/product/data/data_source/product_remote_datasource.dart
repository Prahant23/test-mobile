import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/config/constants/api_endpoints.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/core/network/http_service.dart';
import 'package:vintuff_thrift/feature/product/data/model/product_api_model.dart';


final productRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.read(httpServiceProvider);
  return ProductRemoteDataSource(dio);
});

class ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSource(this.dio);

  Future<Either<Failure, List<ProductApiModel>>> getproduct(int page) async {
    print("Fetching products");
    try {
      Response response =
          await dio.get(ApiEndpoints.getproduct, queryParameters: {
        'page': page,
      });
      print(response.data);
      print(response);
      final List<dynamic> data = response.data["products"];
      final post = data.map((json) => ProductApiModel.fromJson(json)).toList();
      return Right(post);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
}