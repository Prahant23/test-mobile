
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  //... (remaining code for login is the same)
}
