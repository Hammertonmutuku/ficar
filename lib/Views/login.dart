import 'package:ficar/Constants/routes.dart';
import 'package:ficar/components/Login/email_text_field.dart';
import 'package:ficar/components/Login/password_text_field.dart';
import 'package:ficar/errors/erros.dart';
import 'package:ficar/services/auth/auth_exceptions.dart';
import 'package:ficar/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import '../components/Login/size_box.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0x660C9869),
              Color(0x990C9869),
              Color(0xcc0C9869),
              Color(0xff0C9869),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
              child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              const Text(
                'Sign in ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizeBox(),
              EmailTextField(emailController: _emailController),
              const SizeBox(),
              PaaswordTextField(passwordController: _passwordController),
              const SizeBox(),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  const Text(
                    "forgot password?",
                    style: TextStyle(
                      // fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
             const SizeBox(),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                key: const Key('login'),
                child: MaterialButton(
                  minWidth: w,
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    try {
                      if (email.isEmpty) {
                        await showErrorDialog(context, 'Email field is empty');
                        devtools.log('missing email');
                      } else if (password.isEmpty) {
                        await showErrorDialog(
                            context, 'Password field is empty');
                        devtools.log('password is missing');
                      } else {
                        final userCredential =
                            await AuthService.firebase().logIn(
                          email: email,
                          password: password,
                        );
                        final user = AuthService.firebase().currentUser;
                        devtools.log(user.toString());

                        if (user != null) {
                          if (user.isEmailVerified) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                mainRoute, (route) => false);
                            devtools.log(userCredential.toString());
                          } else {
                            emailVerificationDialog(context);
                          }
                        } else {
                          devtools.log('not registered');
                        }
                      }
                    } on UserNotFoundAuthException {
                      await showErrorDialog(context, 'user not found');
                      devtools.log('User not found');
                    } on InvalidEmailAuthException {
                      await showErrorDialog(context, 'invalid-email');
                      devtools.log('invalid email');
                    } on WrongPasswordAuthException {
                      await showErrorDialog(context, 'wrong password');
                      devtools.log('wrong-password');
                    } on GenericAuthException {
                      await showErrorDialog(
                        context,
                        'Authentication error',
                      );
                    } catch (e) {
                      await showErrorDialog(context, e.toString());
                      devtools.log(e.runtimeType.toString());
                    }
                  },
                  child: const Text(
                    'login',
                    style: TextStyle(
                      color: kTextClor,
                      fontSize: 16,
                      // color: Colors.black87,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ]),
          )),
        ),
      ),
    );
  }
}






Future emailVerificationDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Verify your Email'),
        content: const Text(
            'You seem not to have verified your email account, if you did not receive the email click resend'),
        actions: [
          TextButton(
            onPressed: () {
              AuthService.firebase().sendEmailVerification();
              Navigator.of(context).pop(true);
            },
            child: const Text('send verification'),
          )
        ],
      );
    },
  );
}
