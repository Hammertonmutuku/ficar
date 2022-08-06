import 'package:ficar/Views/Account/admin_panel.dart';
import 'package:ficar/Views/Account/my_account.dart';
import 'package:ficar/Views/email_verfication.dart';
import 'package:ficar/Views/home_map.dart';
import 'package:ficar/Views/home_map2.dart';
import 'package:ficar/Views/home_map3.dart';
import 'package:ficar/Views/mainView.dart';
import 'package:ficar/Views/splash_screen.dart';
import 'package:ficar/components/Account/profileMenu/Admin/adminMenu.dart';
import 'package:ficar/components/MyAccount/Profile.dart';
import 'package:ficar/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Constants/routes.dart';
import 'Views/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      theme: ThemeData(

          ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(), 
      routes: {
        loginRoute: (context) => const LoginPage(),
        verifyEmailRoute: (context) => const EmailVerification(),
        homeRoute: (context) => const HomePage(),
        mainRoute: ((context) =>    HomeMap2()),
        myAccountRoute: (context) => const MyAccount(),
        adminRoute: (context) => const AdminMenu(),
        profileRoute: (context) => const Profile(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return const  HomeMap3();
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return  const HomeMap3();
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
