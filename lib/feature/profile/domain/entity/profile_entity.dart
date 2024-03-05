import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;

  const ProfileEntity({
    this.firstName,
    this.lastName,
    this.email
   
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email
        
      ];
}
