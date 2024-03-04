// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductApiModel _$ProductApiModelFromJson(Map<String, dynamic> json) =>
    ProductApiModel(
      id: json['_id'] as String?,
      productName: json['productName'] as String?,
      productPrice: json['productPrice'] as int?,
      productCategory: json['productCategory'] as String?,
      productDescription: json['productDescription'] as String?,
      productImage: json['productImage'] as String?,
    );

Map<String, dynamic> _$ProductApiModelToJson(ProductApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'productCategory': instance.productCategory,
      'productDescription': instance.productDescription,
      'productImage': instance.productImage,
    };
