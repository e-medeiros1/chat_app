import 'package:chat_app/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/screens/home/chat_page.dart';
import 'app/screens/login/login_page.dart';
import 'app/utils/routes.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // fontFamily: 'Montserrat',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black54,
            actionsIconTheme: IconThemeData(
              color: Colors.black54,
            ),
          ),
        ),
        title: 'Chat app',
        // home: CustomGridviewGiphy(),
        initialRoute: NamedRoutes.LOGIN_PAGE,
        routes: {
          NamedRoutes.LOGIN_PAGE: (_) => const LoginPage(),
          NamedRoutes.CHAT_PAGE: (_) => const ChatPage(),
        },
      ),
    ),
  );
}
