import 'package:flutter/material.dart';

void main() {
  runApp(const RegisterPage());
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                        // Small Logo in Top Right Corner
                        Image.asset(
                          'images/fashion.JPG',
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Container with background color and username TextField
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 255, 255, 255), // Set your desired color here
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 10),
                          // Username TextField
                          Expanded(
                            child: TextField(
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              decoration: InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 2, 2, 2)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Email TextField
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 255, 255, 255), // Set your desired color here
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const TextField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Password TextField
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 255, 255, 255), // Set your desired color here
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const TextField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 7, 6, 6)),
                        ),
                      ),
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(
                            255, 255, 255, 255), // Set your desired color here
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const TextField(
                        style:
                            TextStyle(color: Color.fromARGB(255, 10, 10, 10)),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Re-type Password',
                          labelStyle:
                              TextStyle(color: Color.fromARGB(255, 7, 6, 6)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle registration logic
                      },
                      child: const Text('Register'),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      child: const Text(
                        "Already have an account? Sign In here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: Colors.blueAccent),
                      ),
                      onTap: () => Navigator.pushNamed(context, '/loginpage'),
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
