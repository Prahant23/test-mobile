import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_api_model.g.dart';

@JsonSerializable()
class ProfileApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;


  ProfileApiModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email
  });

  factory ProfileApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileApiModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstName,
        lastName,
        email
      ];
}
