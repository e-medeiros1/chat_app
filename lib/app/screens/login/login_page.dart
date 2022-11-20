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
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .02),
                    //First column
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .55,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Let\'s sign you in!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          const Text(
                            'Welcome back! \n You\'ve been missed!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .02),
                          Image.asset(
                            alignment: Alignment.center,
                            'assets/images/7.png',
                            height: MediaQuery.of(context).size.height * .4,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    //Second column
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .38,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: CustomTextField(
                                textEditingController: emailEC,
                                hintText: 'Username'),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: CustomPasswordTextField(
                                textEditingController: passwordEC,
                                hintText: 'Password'),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .01),
                          CustomButton(
                            text: 'Login',
                            onPressed: () {},
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .01),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'Create account \n or',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * .01),
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
                          ),
                        ],
                      ),
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
