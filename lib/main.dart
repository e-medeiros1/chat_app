import 'package:chat_app/app/screens/home/home_page.dart';
import 'package:chat_app/app/screens/login/login_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      home: LoginPage(),
    ),
  );
}
