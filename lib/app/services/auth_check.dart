import 'package:chat_app/app/screens/home/chat_page.dart';
import 'package:chat_app/app/screens/login/login_page.dart';
import 'package:chat_app/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: context.read<AuthService>().isLogged(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data!) {
            return const ChatPage();
          }
          return const LoginPage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
