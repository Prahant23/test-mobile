import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String? productId;
  final String? quantity;

  const CartEntity({
    this.productId,
    this.quantity
   
  });

  @override
  List<Object?> get props => [
        productId,
        quantity,
        
      ];
}
