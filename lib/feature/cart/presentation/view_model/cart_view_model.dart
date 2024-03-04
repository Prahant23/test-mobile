import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/feature/cart/data/data_source/cart_remote_datasource.dart';
import 'package:vintuff_thrift/feature/cart/presentation/state/cart_state.dart';
import 'package:vintuff_thrift/feature/product/presentation/state/product_state.dart';

final cartViewModelProvider =
    StateNotifierProvider<CartViewModel, CartState>((ref) {
  final cartRemoteDataSource = ref.read(cartRemoteDataSourceProvider);
  return CartViewModel(cartRemoteDataSource);
});

class CartViewModel extends StateNotifier<CartState> {
  final CartRemoteDataSource cartRemoteDataSource;
  CartViewModel(this.cartRemoteDataSource)
      : super(CartState.initial());

  Future getcart() async {
    state = state.copyWith(isLoading: true, hasreachedmax: false);
    final currentState = state;
    final page = currentState.page + 1;
    final cart = currentState.cartApiModel;
    final hasreachedmax = currentState.hasreachedmax;
    if (!hasreachedmax) {
      final result = await cartRemoteDataSource.getcart(page);
      result.fold(
          (Failure) => state =
              state.copyWith(isLoading: true, hasreachedmax: true), (data) {
        if (data.isEmpty) {
          state = state.copyWith(hasreachedmax: true);
        } else {
          state = state.copyWith(
              cartApiModel: [...cart, ...data],
              page: page,
              isLoading: false,
              hasreachedmax: false);
        }
      });
    }
  }

  Future resetState() async {
    state = CartState.initial();
    getcart();
  }
}
