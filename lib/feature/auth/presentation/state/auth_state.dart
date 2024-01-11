class AuthState {
  final bool isLoading;
  final String? error;
  final bool isSuccess; // Add this line
  AuthState({
    required this.isLoading,
    this.error,
    this.isSuccess = false, // Initialize the flag
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
