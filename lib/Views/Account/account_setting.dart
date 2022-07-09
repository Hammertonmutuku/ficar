import 'package:ficar/components/Account/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:ficar/Constants/routes.dart';
import 'package:ficar/components/Account/header.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: kSpacingUnit.w * 5,
          ),
          const Header(),
          const ProfileMenu(),
          
        ],
      ),
    );
  }
}
