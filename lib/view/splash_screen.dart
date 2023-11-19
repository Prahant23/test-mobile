import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vintuff_thrift/view/login.dart';

void main() {
  runApp(const SplashScreen());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, Key? splashscreen});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: const Color(0xffd9d9d9),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'images/fashion.JPG', //
                      width: 250,
                      height: 255,
                    ),
                  ),
                ),
                // Rest of the content
                const Text(
                  'WELCOME TO THRIFT STORE',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.33,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'OUR THRIFT STORE, ALSO KNOWN AS A SECONDHAND STORE OR CHARITY SHOP,IS A RETAIL ESTABLISHMENT THAT SELLS USED OR PRE-OWNED ITEMS AT SIGNIFICANTLY LOWER PRICES COMPARED TO TRADITIONAL RETAIL STORES. \n\nOUR STORES OFTEN STOCK A WIDE VARIETY OF MERCHANDISE, INCLUDING ONLY CLOTHING, BOOKS,AND \n\nSHOES ITEMS. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.21,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
