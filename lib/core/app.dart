import 'package:flutter/material.dart';
import 'package:vintuff_thrift/view/dashboard.dart';
import 'package:vintuff_thrift/view/login.dart';
import 'package:vintuff_thrift/view/registration.dart';
import 'package:vintuff_thrift/view/splash_screen.dart';

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
        MyRoutes.homeRoute: (context) => const VintageStoreHomePage(),
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
