import 'package:hive_flutter/adapters.dart';
import 'package:vintuff_thrift/config/constants/hive_table_constants.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String email;
  @HiveField(5)
  final String password;

  AuthHiveModel(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  // empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          firstName: '',
          lastName: '',
          email: '',
          password: '',
        );

  @override
  String toString() {
    return 'userId: $userId, firstName: $firstName,lastName: $lastName,email: $email,password: $password';
  }
}
