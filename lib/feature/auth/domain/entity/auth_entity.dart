import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const AuthEntity({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
  });

  @override
  List<Object?> get props => [id, firstName, lastName, password, email];
}
