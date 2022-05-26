import 'package:ficar/Constants/routes.dart';
import 'package:flutter/material.dart';

class PaaswordTextField extends StatelessWidget {
  const PaaswordTextField({
    Key? key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController, super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      obscureText: true,
      controller: _passwordController,
      textInputAction: TextInputAction.next,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.vpn_key,
          color: kPrimaryColor,
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
    );
  }
}