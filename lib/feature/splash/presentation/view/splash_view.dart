import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vintuff_thrift/config/routes/app_route.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    // Wait for 2 seconds and then navigate
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRoute.loginRoute);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('assets/images/fashion.jpg'),
                ),
                const Text(
                  'Welcome to Vintuff',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 10),
                const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
