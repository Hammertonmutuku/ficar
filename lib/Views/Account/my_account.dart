import 'package:ficar/Views/Account/account_setting.dart';
import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({ Key? key }) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return AccountPage();
  }
}