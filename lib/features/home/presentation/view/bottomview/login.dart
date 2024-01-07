import 'package:flutter/material.dart';

void main() {
  runApp(const LoginPage());
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 175, 163, 76), Colors.blue],
            ),
          ),
          child: Center(
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Small Logo
                        Image.asset(
                          'assets/images/fashion.jpg',
                          width: 300,
                          height: 150,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Login Page',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Username TextField container
                    const SizedBox(
                      height: 60,
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    //  Password TextField container
                    const SizedBox(
                      height: 60,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Password'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/homepage');
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      child: const Text(
                        "New User? Create Account Here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent),
                      ),
                      onTap: () => Navigator.pushNamed(context, '/signuppage'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
