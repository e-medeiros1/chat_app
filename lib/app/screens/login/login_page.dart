import 'package:chat_app/app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_password_textfield.dart';
import '../../widgets/custom_textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameEC = TextEditingController();
  final passwordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  login() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, NamedRoutes.CHAT_PAGE,
          arguments: usernameEC.text);
    }
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
                              height:
                                  MediaQuery.of(context).size.height * .015),
                          Container(
                            height: MediaQuery.of(context).size.height * .4,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/7.png'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(12)),
                          ),
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
                    Form(
                      key: _formKey,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .38,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: CustomTextField(
                                textEditingController: usernameEC,
                                hintText: 'Username',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please type your username';
                                  } else if (value.length < 6) {
                                    return 'Your username should be more than 6 characters';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: CustomPasswordTextField(
                                textEditingController: passwordEC,
                                hintText: 'Password',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  } else if (value.length < 6) {
                                    return 'Your password should be more than 6 characters';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01),
                            CustomButton(
                              text: 'Login',
                              onPressed: login,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .01),
                            const Text(
                              'Made by Medeiros \n find me on:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black87,
                                letterSpacing: -0.5,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SocialMediaButton.github(
                                  url: 'https://github.com/e-medeiros1',
                                  size: 30,
                                ),
                                SocialMediaButton.linkedin(
                                  url:
                                      'https://www.linkedin.com/in/erimedeiros/',
                                  color: Colors.blue.shade800,
                                  size: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
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
