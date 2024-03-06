import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/config/constants/api_endpoints.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/core/network/http_service.dart';
import 'package:vintuff_thrift/core/shared_prefs/user_shared_prefs.dart';
import 'package:vintuff_thrift/feature/cart/data/model/cart_api_model.dart';

final cartRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.read(httpServiceProvider);
  final userSharedPrefs = ref.read(userSharedPrefsProvider);
  return CartRemoteDataSource(dio, userSharedPrefs);
});

class CartRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;
  CartRemoteDataSource(this.dio, this.userSharedPrefs);

  Future<Either<Failure, List<CartApiModel>>> getcart(int page) async {
    print("Fetching cart");
    final result = await userSharedPrefs.getUserToken();
    try {
      String token = '';
      result.fold((l) => null, (r) {
        token = r!;
      });
      Response response = await dio.get(ApiEndpoints.getcart,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print(response.data);
      print(response);
      final List<dynamic> data = response.data["cart"];
      final post = data.map((json) => CartApiModel.fromJson(json)).toList();
      return Right(post);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

  Future<Either<Failure, bool>> addToCart(CartApiModel cartApiModel) async {
    final result = await userSharedPrefs.getUserToken();
    try {
      String token = '';
      result.fold((l) => null, (r) {
        token = r!;
      });
      Response response = await dio.post(ApiEndpoints.addToCart,
          data: cartApiModel.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return Right(true);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteFromCart(String id) async {
    final result = await userSharedPrefs.getUserToken();
    try {
      String token = '';
      result.fold((l) => null, (r) {
        token = r!;
      });
      Response response = await dio.delete(
          '${ApiEndpoints.deleteFromCart}/${id}',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      return Right(true);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
}
