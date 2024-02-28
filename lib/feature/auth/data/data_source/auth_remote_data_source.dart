import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:vintuff_thrift/config/constants/api_endpoints.dart';
import 'package:vintuff_thrift/core/failure/failure.dart';
import 'package:vintuff_thrift/feature/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource {
  final Dio dio;

  AuthLocalDataSource(this.dio);

  Future<Either<Failure, bool>> registerUser(AuthEntity user) async {
    try {
      final response = await dio.post(
        ApiEndpoints.register,
        data: {
          'firstName': user.firstName,
          'lastName': user.lastName,
          'email': user.email,
          'password': user.password,
        },
      );

      // Check the response and handle accordingly
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
            error: 'Registration failed',
            statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      return Left(
          Failure(error: 'Error during registration', statusCode: '500'));
    }
  }

  Future<Either<Failure, bool>> loginUser(String email, String password) async {
    try {
      final response = await dio.post(
        ApiEndpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );

      // Check the response and handle accordingly
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(Failure(
            error: 'Login failed', statusCode: response.statusCode.toString()));
      }
    } catch (error) {
      return Left(Failure(error: 'Error during login', statusCode: '500'));
    }
  }
}
