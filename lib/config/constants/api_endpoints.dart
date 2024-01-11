class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  static const String baseUrl = "http://10.0.2.2:5000/api/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
}
