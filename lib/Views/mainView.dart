
import 'package:ficar/Constants/routes.dart';
import 'package:ficar/Views/Account/account_setting.dart';
import 'package:ficar/Views/home.dart';
import 'package:ficar/Views/notifications.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final screens = [
    const HomePage(),
    // const NotificationPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: kPrimaryColor,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        child: NavigationBar(
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
             labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            animationDuration: const Duration(seconds: 1),
            destinations: const  [
               NavigationDestination(
                icon:  Icon(Icons.home),
                selectedIcon:  Icon(Icons.home, color: Colors.white,),
                label: 'Home',
              ),
              //  NavigationDestination(
              //   icon: Icon(Icons.notifications),
              //   selectedIcon:Icon(Icons.notifications, color: Colors.white,),
              //   label: 'notifications',
              // ),
             NavigationDestination(
                icon:  Icon(Icons.manage_accounts),
                selectedIcon: Icon(Icons.manage_accounts, color: Colors.white,),
                label: 'Account',
              ),
            ]),
      ),
    );
  }
}
