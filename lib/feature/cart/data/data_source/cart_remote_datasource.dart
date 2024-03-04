import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/config/constants/api_endpoints.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/core/network/http_service.dart';
import 'package:vintuff_thrift/feature/cart/data/model/cart_api_model.dart';
import 'package:vintuff_thrift/feature/product/data/model/product_api_model.dart';


final cartRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.read(httpServiceProvider);
  return CartRemoteDataSource(dio);
});

class CartRemoteDataSource {
  final Dio dio;

  CartRemoteDataSource(this.dio);

  Future<Either<Failure, List<CartApiModel>>> getcart(int page) async {
    print("Fetching cart");
    try {
      Response response =
          await dio.get(ApiEndpoints.getcart, queryParameters: {
        'page': page,
      });
      print(response.data);
      print(response);
      final List<dynamic> data = response.data["carts"];
      final post = data.map((json) => CartApiModel.fromJson(json)).toList();
      return Right(post);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
}