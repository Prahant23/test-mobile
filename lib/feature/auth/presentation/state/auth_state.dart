class AuthState {
  final bool isLoading;
  final String? error;
  final bool isSuccess; 
  final bool? showMessage;// Add this line
  AuthState({
    required this.isLoading,
    this.error,
    this.isSuccess = false,
    this.showMessage, // Initialize the flag
  });

  factory AuthState.initial() {
    return AuthState(
      isLoading: false,
      error: null,
      showMessage: false,
    );
  }

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? imageName,
    bool? showMessage,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      showMessage: showMessage ?? this.showMessage,
    );
  }

  @override
  String toString() => 'AuthState(isLoading: $isLoading, error: $error)';
}
