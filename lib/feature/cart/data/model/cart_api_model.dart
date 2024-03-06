import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vintuff_thrift/feature/product/domain/entity/product_entity.dart';

part 'cart_api_model.g.dart';

@JsonSerializable()
class CartApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? productId;
  final int? quantity;
  final String? productImg;
  final String? productName;
  final double? productPrice;
  CartApiModel(
      {this.id,
      this.productId,
      this.quantity,
      this.productImg,
      this.productName,
      this.productPrice});

  factory CartApiModel.fromJson(Map<String, dynamic> json) =>
      _$CartApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartApiModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        productId,
        quantity,
        productImg,
        productName,
        productPrice,
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
