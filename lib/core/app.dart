import 'package:flutter/material.dart';
import 'package:vintuff_thrift/features/home/presentation/view/bottomview/dashboard.dart';
import 'package:vintuff_thrift/features/home/presentation/view/bottomview/login.dart';
import 'package:vintuff_thrift/features/home/presentation/view/bottomview/registration.dart';
import 'package:vintuff_thrift/features/home/presentation/view/bottomview/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vintuff',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const DashBoardViewss(),
        MyRoutes.signupRoute: (context) => const RegisterPage(),
      },
    );
  }
}

class MyRoutes {
  static String homeRoute = "/homepage";
  static String loginRoute = "/loginpage";
  static String signupRoute = "/signuppage";
}
