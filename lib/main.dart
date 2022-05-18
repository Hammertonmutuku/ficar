import 'package:ficar/Views/account.dart';
import 'package:ficar/Views/home.dart';
import 'package:ficar/Views/login.dart';
import 'package:ficar/Views/notifications.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          //primarySwatch: Color(0xff20552E),

          ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  final screens = [
    const HomePage(),
    const NotificationPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Color.fromARGB(255, 169, 245, 197),
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        child: NavigationBar(
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            animationDuration: Duration(seconds: 1),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications_outlined),
                selectedIcon: Icon(Icons.notifications),
                label: 'notifications',
              ),
              NavigationDestination(
                icon: Icon(Icons.manage_accounts_outlined),
                selectedIcon: Icon(Icons.manage_accounts),
                label: 'Account',
              ),
            ]),
      ),
    );
    //   return Scaffold(
    //     appBar: AppBar(title: const Text('HomePage')),
    //     body: screens[index],
    //     bottomNavigationBar: NavigationBarTheme(
    //       data: NavigationBarThemeData(
    //         indicatorColor: Color.fromARGB(255, 169, 245, 197),
    //         labelTextStyle: MaterialStateProperty.all(
    //           TextStyle(
    //             fontSize: 14,
    //             fontWeight: FontWeight.w400,
    //           ),
    //         ),
    //       ),
    //       child: NavigationBar(
    //         height: 60,
    //         selectedIndex: index,
    //         onDestinationSelected: (index) => setState(() => this.index = index),
    //         labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    //         animationDuration: Duration(seconds: 3),
    //         destinations: [
    //           NavigationDestination(
    //             icon: Icon(Icons.home_outlined),
    //             selectedIcon: Icon(Icons.home),
    //             label: 'Home',
    //           ),
    //           NavigationDestination(
    //             icon: Icon(Icons.notifications_outlined),
    //             selectedIcon: Icon(Icons.notifications),
    //             label: 'notifications',
    //           )
    // }
  }
}
