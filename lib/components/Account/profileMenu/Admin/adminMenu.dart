import 'package:ficar/components/Account/profileMenu/Admin/create_account.dart';
import 'package:flutter/material.dart';

class AdminMenu extends StatefulWidget {
  const AdminMenu({Key? key}) : super(key: key);

  @override
  State<AdminMenu> createState() => _AdminMenuState();
}

class _AdminMenuState extends State<AdminMenu> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Dashboard",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const CreateAccount(),
    );
  }
}

