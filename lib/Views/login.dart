import 'package:flutter/material.dart';

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
              Color(0x665ac18e),
              Color(0x995ac18e),
              Color(0xcc5ac18e),
              Color(0xff5ac18e),
            ])),
            
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
            const SizedBox(
                height: 15,
            ),
            TextField(
                autofocus: false,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.mail, color: Color(0xff5ac18e)),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Email",
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
            ),
            const SizedBox(
                height: 15,
            ),
            TextField(
                autofocus: false,
                obscureText: true,
                controller: _passwordController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.vpn_key,
                    color: Color(0xff5ac18e),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Password",
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
            ),
            const SizedBox(
                height: 10,
            ),
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
            const SizedBox(
                height: 10,
            ),
            Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                key: const Key('login'),
                child: MaterialButton(
                  minWidth: w,
                  onPressed: () async {},
                  child: const Text(
                    'login',
                    style: TextStyle(
                       fontSize: 16,
                      // color: Colors.black87,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            )
          ]),
              )),
        ),
      ),
    );
  }
}
