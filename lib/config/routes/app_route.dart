import 'package:vintuff_thrift/feature/auth/presentation/view/loginpage_view.dart';
import 'package:vintuff_thrift/feature/auth/presentation/view/signup_view.dart';
import 'package:vintuff_thrift/feature/splash/presentation/view/splash_view.dart';
import 'package:vintuff_thrift/views/dashboard/dashboard_view.dart';

class AppRoute {
  AppRoute._();
  static const String splashRoute = '/splash';
  static const String loginRoute = "/login";
  static const String signupRoute = "/signup";
  static const String dashboardRoute = "/dashboard";
  static const String forgotpasswordRoute = "/forgotpassword";

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginPageView(),
      signupRoute: (context) => const SignupView(),
      dashboardRoute: (context) => const DashboardView(),
      // forgotpasswordRoute: (context) => const forgetpassword(),
    };
  }
}
