class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  static const String baseUrl = "http://192.168.1.75:4000/api/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
}
