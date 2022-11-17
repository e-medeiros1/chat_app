import 'package:flutter/material.dart';

import 'app/screens/login/login_page.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat app',
      home: LoginPage(),
    ),
  );
}
