import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/config/routes/app_route.dart';
import 'package:vintuff_thrift/feature/auth/domain/entity/auth_entity.dart';
import 'package:vintuff_thrift/feature/auth/domain/use_case/auth_usecase_provider.dart';

import '../../../auth/domain/use_case/auth_usecase.dart';
import '../state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(ref.read(authUseCaseProvider));
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase authUseCase;

  AuthViewModel(this.authUseCase) : super(AuthState.initial());

  Future<void> registerUser(AuthEntity user) async {
    state = state.copyWith(isLoading: true);
    final result = await authUseCase.registerUser(user);
    result.fold(
      (failure) =>
          state = AuthState(isLoading: false, error: failure.statusCode),
      (success) => state = AuthState(isLoading: false, isSuccess: true),
    );
  }

  Future<void> loginStaff(
      String email, String password, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final result = await authUseCase.loginUser(email, password);
    state = state.copyWith(isLoading: false);

    result.fold(
      (failure) {
        state = state.copyWith(
          error: failure.error,
          // showMessage: true,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.error),
          ),
        );
      },
      (success) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Logging in...'),
            ),
          );
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.pushReplacementNamed(context, AppRoute.dashboardRoute);
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid username or password'),
            ),
          );
        }
      },
    );
  }

  void reset() {
    state = state.copyWith(
      isLoading: false,
      error: null,
      imageName: null,
      showMessage: false,
    );
  }

  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
