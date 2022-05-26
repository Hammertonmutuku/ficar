
import 'package:flutter/material.dart';
import 'package:ficar/Constants/routes.dart';
import 'package:ficar/services/auth/auth_service.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(
        children: [
          const Text('we have already sent you a verificaton email. Incase you have not received it kindly check the button below'),
          TextButton(
            onPressed: () async {
              final user = AuthService.firebase().currentUser;
              AuthService.firebase().sendEmailVerification();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: const Text('send email verification'),
          ),
          TextButton(onPressed: (){
            AuthService.firebase().logOut();
            Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);
          }, child:const Text('Back to login page'))
        ],
      ),
    );
  }
}
