import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/feature/messages/data/model/product.dart';
import 'package:vintuff_thrift/feature/messages/presentation/state/my_profile_state.dart';
import 'package:vintuff_thrift/feature/product/data/data_source/product_remote_datasource.dart';
import 'package:vintuff_thrift/feature/product/presentation/state/product_state.dart';

final productViewModelProvider =
    StateNotifierProvider<ProductViewModel, ProductState>((ref) {
  final productRemoteDataSource = ref.read(productRemoteDataSourceProvider);
  return ProductViewModel(productRemoteDataSource);
});

class ProductViewModel extends StateNotifier<ProductState> {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductViewModel(this.productRemoteDataSource)
      : super(ProductState.initial());

  Future getProduct() async {
    state = state.copyWith(isLoading: true, hasreachedmax: false);
    final currentState = state;
    final page = currentState.page + 1;
    final product = currentState.productApiModel;
    final hasreachedmax = currentState.hasreachedmax;
    if (!hasreachedmax) {
      final result = await productRemoteDataSource.getproduct(page);
      result.fold(
          (Failure) => state =
              state.copyWith(isLoading: true, hasreachedmax: true), (data) {
        if (data.isEmpty) {
          state = state.copyWith(hasreachedmax: true);
        } else {
          state = state.copyWith(
              productApiModel: [...product, ...data],
              page: page,
              isLoading: false,
              hasreachedmax: false);
        }
      });
    }
  }

  Future resetState() async {
    state = ProductState.initial();
    getProduct();
  }
}
