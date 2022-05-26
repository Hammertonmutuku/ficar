import 'package:ficar/Views/email_verfication.dart';
import 'package:ficar/Views/mainView.dart';
import 'package:ficar/Views/splash_screen.dart';
import 'package:ficar/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'Constants/routes.dart';
import 'Views/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginPage(),
        verifyEmailRoute: (context) => const EmailVerification(),
        homeRoute: (context) => const HomePage(),
        mainRoute: ((context) => MainPage())
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return MainPage();
              } else {
                return const EmailVerification();
              }
            } else {
              return const LoginPage();
            }

          default:
            return const SplashScreen();
        }
      },
    );
  }
}
