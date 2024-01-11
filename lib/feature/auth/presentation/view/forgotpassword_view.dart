import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  bool _passwordVisible = false;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: SizedBox(
                          width: 200,
                          height: 150,
                          /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                          child: Image.asset('assets/images/fashion.jpg')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Text('VINTUFF',
                        style: GoogleFonts.exo(
                            textStyle:
                                Theme.of(context).textTheme.headlineLarge,
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("Password"),
                          prefixIcon: const Icon(
                            Icons.lock_open_outlined,
                            size: 20,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                            ),
                          )),
                      validator: (value) {
                        if (value == "") {
                          return "password_cannot_be_empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 48)),
                        maximumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 48)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(84, 175, 230, 1)),
                        // Replace 'red' with 'Colors.red'
                      ),
                      onPressed: () {},
                      child: const Text("Change Password"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
