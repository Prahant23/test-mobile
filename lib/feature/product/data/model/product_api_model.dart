import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vintuff_thrift/feature/product/domain/entity/product_entity.dart';

part 'product_api_model.g.dart';

@JsonSerializable()
class ProductApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? productName;
  final int? productPrice;
  final String? productCategory;
  final String? productDescription;
  final String? productImage;

  ProductApiModel({
    this.id,
    required this.productName,
    required this.productPrice,
    required this.productCategory,
    required this.productDescription,
    required this.productImage,
  });

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductApiModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        productName,
        productImage,
        productDescription,
        productCategory,
        productPrice
      ];

  // Convert API model to domain entity
//   ProductEntity toEntity() {
//     return ProductEntity(
//       id: id,
//       productName: productName,
//       productPrice: productPrice,
//       productCategory: productCategory,
//       productDescription: productDescription,
//       productImage: productImage,
//     );
//   }

//   // Create API model from domain entity
//   factory ProductApiModel.fromEntity(ProductEntity entity) {
//     return ProductApiModel(
//       id: entity.id,
//       productName: entity.productName,
//       productPrice: entity.productPrice,
//       productCategory: entity.productCategory,
//       productDescription: entity.productDescription,
//       productImage: entity.productImage,
//     );
//   }
}
