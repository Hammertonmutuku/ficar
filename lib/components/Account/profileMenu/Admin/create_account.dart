import 'package:ficar/Constants/routes.dart';
import 'package:ficar/DialogBox/success/success.dart';
import 'package:ficar/components/Account/profileMenu/Admin/role_text_field.dart';
import 'package:ficar/components/Login/email_text_field.dart';
import 'package:ficar/components/Login/password_text_field.dart';
import 'package:ficar/DialogBox/errors/erros.dart';
import 'package:ficar/services/auth/auth_exceptions.dart';
import 'package:ficar/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../Login/size_box.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref2 = FirebaseDatabase.instance.ref("users");
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  get devtools => null;

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
    return Column(
      children: [
        Card(
          shadowColor: kPrimaryColor,
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x665ac18e),
                  Color(0x995ac18e),
                  Color(0xcc5ac18e),
                  Color(0xff5ac18e),
                ],
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizeBox(),
                EmailTextField(emailController: _emailController),
                const SizeBox(),
                PasswordTextField(passwordController: _passwordController),
                const SizeBox(),
                const RoleField(),
                const SizeBox(),
                Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                key: const Key('Create Account'),
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
                            await AuthService.firebase().createUser(
                          email: email,
                          password: password,
                        );
              
                        final user =  userCredential;
                        
                        
                        
                        
                        // devtools.log(user.toString());
                        AuthService.firebase().sendEmailVerification();
                        successDialog(context, 'You have successfully created an account');
                      }
                } on EmailAlreadyInUseAuthException {
                  await showErrorDialog(context, 'email already in use');
                  devtools.log('email already in use');
                } on InvalidEmailAuthException {
                  await showErrorDialog(context, 'Invalid email');
                  devtools.log('Invalid email');
                } on GenericAuthException {
                  await showErrorDialog(
                    context,
                    'Failed to register',
                  );
                 }  
                 //catch (e) {
                //   await showErrorDialog(context, e.toString());
                // }
                  },
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: kTextClor,
                      fontSize: 16,
                      // color: Colors.black87,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
