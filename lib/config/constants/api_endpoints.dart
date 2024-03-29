class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  // For Windows
  static const String baseUrl = "http://localhost:4000/api/";

  // ====================== Auth Routes ======================
  static const String login = "user/login";
  static const String register = "user/create";
  static const String getproduct = "product/getProduct";
  static const String getcart = "cart";
  static const String addToCart = "cart/addtocart";
  static const String getprofile = "user/getUsers";
  static const String deleteFromCart = "cart/delete";
}
