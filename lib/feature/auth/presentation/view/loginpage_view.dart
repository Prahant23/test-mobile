import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vintuff_thrift/feature/auth/presentation/view_model/auth_viewmodel.dart';

class LoginPageView extends ConsumerStatefulWidget {
  const LoginPageView({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends ConsumerState<LoginPageView> {
  bool _passwordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
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
                    child: Text('Vintuff',
                        style: GoogleFonts.exo(
                            textStyle:
                                Theme.of(context).textTheme.headlineLarge,
                            fontSize: 24,
                            color: Theme.of(context).colorScheme.primary)),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter email',
                      ),
                    ),
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
                          return "Please enter your password";
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
                      onPressed: () async {
                        {
                          await ref
                              .read(authViewModelProvider.notifier)
                              .loginStaff(emailController.text,
                                  passwordController.text, context);
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/forgotpassword');
                          },
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: 'Forget Password',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontSize: 18,
                                fontFamily: 'Exo',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: 0.18,
                              ),
                            ),
                          ])),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Dont have account?  ',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 18,
                              fontFamily: 'Exo',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.18,
                            ),
                          ),
                          const TextSpan(
                            text: 'Sign up now!',
                            style: TextStyle(
                              color: Color.fromRGBO(84, 175, 230, 1),
                              fontSize: 18,
                              fontFamily: 'Exo',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: 0.18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Text.rich(
                TextSpan(),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}
