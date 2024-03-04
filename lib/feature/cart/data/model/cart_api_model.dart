import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vintuff_thrift/feature/product/domain/entity/product_entity.dart';

part 'cart_api_model.g.dart';

@JsonSerializable()
class CartApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? productId;
  final String? quantity;
  

  CartApiModel({
    this.productId,
    required this.quantity,
   
  
  });

  factory CartApiModel.fromJson(Map<String, dynamic> json) =>
      _$CartApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartApiModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        productId,
        quantity,
       
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
