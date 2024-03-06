import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/core/common/snackbar/my_snackbar.dart';
import 'package:vintuff_thrift/feature/cart/data/data_source/cart_remote_datasource.dart';
import 'package:vintuff_thrift/feature/cart/data/model/cart_api_model.dart';
import 'package:vintuff_thrift/feature/cart/domain/entity/cart_entity.dart';
import 'package:vintuff_thrift/feature/cart/presentation/state/cart_state.dart';
import 'package:vintuff_thrift/feature/product/presentation/state/product_state.dart';

final cartViewModelProvider =
    StateNotifierProvider<CartViewModel, CartState>((ref) {
  final cartRemoteDataSource = ref.read(cartRemoteDataSourceProvider);
  return CartViewModel(cartRemoteDataSource);
});

class CartViewModel extends StateNotifier<CartState> {
  final CartRemoteDataSource cartRemoteDataSource;
  CartViewModel(this.cartRemoteDataSource) : super(CartState.initial()) {
    // getcart();
  }

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
              cartApiModel: data,
              page: page,
              isLoading: false,
              hasreachedmax: false);
        }
      });
      print(state.cartApiModel);
    }
  }

  Future addToCart(CartApiModel cartEntity, BuildContext context) async {
    final result = await cartRemoteDataSource.addToCart(cartEntity);
    result.fold((Failure) => null, (data) {
      showSnackBar(message: 'Added to cart', context: context);
    });
  }

  Future deleteFromCart(String id, BuildContext context) async {
    final result = await cartRemoteDataSource.deleteFromCart(id);
    result.fold((Failure) => null, (data) {
      showSnackBar(message: 'Deleted from cart', context: context);
      resetState();
    });
  }

  Future resetState() async {
    state = CartState.initial();
    getcart();
  }
}
