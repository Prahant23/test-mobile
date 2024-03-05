import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/config/constants/api_endpoints.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/core/network/http_service.dart';
import 'package:vintuff_thrift/feature/profile/data/model/profile_api_model.dart';


final profileRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.read(httpServiceProvider);
  return ProfileRemoteDataSource(dio);
});

class ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSource(this.dio);

  Future<Either<Failure, List<ProfileApiModel>>> getprofile(int page) async {
    print("Fetching profile");
    try {
      Response response =
          await dio.get(ApiEndpoints.getprofile, queryParameters: {
        'page': page,
      });
      print(response.data);
      print(response);
      final List<dynamic> data = response.data["profiles"];
      final post = data.map((json) => ProfileApiModel.fromJson(json)).toList();
      return Right(post);
    } on DioException catch (e) {
      return Left(Failure(error: e.message.toString()));
    }
  }
}