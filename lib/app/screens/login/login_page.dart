import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_password_textfield.dart';
import '../../widgets/custom_textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Let\'s sign you in!',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                  const Text(
                    'Welcome back!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'You\'ve been missed!',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Image.asset('assets/images/7.png',
                            height: MediaQuery.of(context).size.height * .501,
                            fit: BoxFit.cover),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 312,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: CustomTextField(
                                textEditingController: emailEC,
                                hintText: 'Username'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8),
                            child: CustomPasswordTextField(
                                textEditingController: passwordEC,
                                hintText: 'Password'),
                          ),
                          CustomButton(
                            text: 'Login',
                            onPressed: () {},
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Create account',
                              style: TextStyle(
                                color: Colors.black87,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          const Text(
                            'or',
                            style: TextStyle(
                              color: Colors.black87,
                              letterSpacing: -0.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.facebook,
                                size: 35,
                                color: Colors.blue.shade800,
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.facebook,
                                size: 35,
                                color: Colors.blue.shade800,
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
