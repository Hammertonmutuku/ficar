import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Write extends StatefulWidget {
  const Write({Key? key}) : super(key: key);

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref2 = FirebaseDatabase.instance.ref("dailyspecial/age");
  String displyText = "results go here";
  late StreamSubscription _dailySpecialStream;

    @override
  void initState() {
    _activeListener();
    super.initState();
  }

  void _activeListener() {
    _dailySpecialStream = database.ref("dailyspecial/name").onValue.listen((event) {
    final String name1 =  event.snapshot.value.toString();
      setState(() {
        displyText = 'name : $name1';
      });

    });
  }

  @override
  void deactivate() {
    _dailySpecialStream.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('write')),
      body: Column(
        children: [
          Text(displyText),
        ],
      ),
    );
  }
}
