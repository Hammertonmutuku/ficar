import 'package:flutter/material.dart';

import 'dart:developer' as devtools show log;



import 'package:ficar/Constants/routes.dart';
import 'package:ficar/DialogBox/errors/erros.dart';
import 'package:ficar/services/auth/auth_exceptions.dart';
import 'package:ficar/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register view'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          children: [
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email address'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                try {
                  final userCredential =
                      await AuthService.firebase().createUser(
                    email: email,
                    password: password,
                  );
                  final user = AuthService.firebase().currentUser;
                  AuthService.firebase().sendEmailVerification();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      verifyEmailRoute, (route) => false);
                   devtools.log(userCredential.toString());
                } on WeakPasswordAuthException {
                  await showErrorDialog(context, 'weak-password');
                  // devtools.log('weak-password');
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(context, 'email already in use');
                  // devtools.log('email already in use');
                } on InvalidEmailAuthException {
                  await showErrorDialog(context, 'Invalid email');
                  // devtools.log('Invalid email');
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Failed to register',
                  );
                }  catch (e) {
                  await showErrorDialog(context, e.toString());
                }
              },
              child: const Text('register'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text('Already Registered. Login!'),
            ),
          ],
        )),
      ),
    );
  }
}
