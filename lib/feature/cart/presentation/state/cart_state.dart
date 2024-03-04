
import 'package:vintuff_thrift/feature/cart/data/model/cart_api_model.dart';
import 'package:vintuff_thrift/feature/product/data/model/product_api_model.dart';

class CartState {
  final List< CartApiModel> cartApiModel;
  final bool hasreachedmax;
  final String? error;
  final bool isSuccess;
  final bool? showMessage;
  final bool isLoading;
  final int page;

  CartState(
      {required this.cartApiModel,
      required this.hasreachedmax,
      this.error,
      this.isSuccess = false,
      this.showMessage,
      required this.isLoading,
      required this.page});

  factory CartState.initial() {
    return CartState(
      cartApiModel: [],
      hasreachedmax: false,
      isLoading: false,
      error: null,
      showMessage: false,
      page: 0,
    );
  }

  CartState copyWith({
    List<CartApiModel>? cartApiModel,
    bool? hasreachedmax,
    bool? isLoading,
    String? error,
    bool? showMessage,
    int? page,
  }) {
    return CartState(
      cartApiModel: cartApiModel ?? this.cartApiModel,
      hasreachedmax: hasreachedmax ?? this.hasreachedmax,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}