import 'package:ficar/Constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: <Widget>[
        ProfileMenuItems(
          text: "Admin Panel",
          icon: Icons.admin_panel_settings_outlined,
          press: () => {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(adminRoute, (route) => false)
          },
        ),
        ProfileMenuItems(
          text: "My Account",
          icon: Icons.manage_accounts_outlined,
          press: () => {
            Navigator.of(context).pushNamedAndRemoveUntil(
                                profileRoute, (route) => false)
          },
        ),
        ProfileMenuItems(
          text: "Notifications",
          icon: Icons.notifications_active_outlined,
          press: () => {},
        ),
        ProfileMenuItems(
          text: "Setting",
          icon: Icons.settings_outlined,
          press: () => {},
        ),
        ProfileMenuItems(
          text: "Sign Out",
          icon: Icons.logout,
          press: () => {},
        ),
      ],
    ));
  }
}

class ProfileMenuItems extends StatelessWidget {
  const ProfileMenuItems({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
              horizontal: kSpacingUnit.w * 2, vertical: 13),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3)),
          backgroundColor: const Color.fromARGB(255, 214, 216, 224),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            )),
            const Icon(
              Icons.arrow_forward_ios,
              color: kDarkPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
