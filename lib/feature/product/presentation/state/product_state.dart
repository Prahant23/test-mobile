
import 'package:vintuff_thrift/feature/product/data/model/product_api_model.dart';

class ProductState {
  final List< ProductApiModel> productApiModel;
  final bool hasreachedmax;
  final String? error;
  final bool isSuccess;
  final bool? showMessage;
  final bool isLoading;
  final int page;

  ProductState(
      {required this.productApiModel,
      required this.hasreachedmax,
      this.error,
      this.isSuccess = false,
      this.showMessage,
      required this.isLoading,
      required this.page});

  factory ProductState.initial() {
    return ProductState(
      productApiModel: [],
      hasreachedmax: false,
      isLoading: false,
      error: null,
      showMessage: false,
      page: 0,
    );
  }

  ProductState copyWith({
    List<ProductApiModel>? productApiModel,
    bool? hasreachedmax,
    bool? isLoading,
    String? error,
    bool? showMessage,
    int? page,
  }) {
    return ProductState(
      productApiModel: productApiModel ?? this.productApiModel,
      hasreachedmax: hasreachedmax ?? this.hasreachedmax,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
    );
  }
}