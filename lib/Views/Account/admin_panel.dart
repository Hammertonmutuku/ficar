import 'package:ficar/Views/data/read.dart';
import 'package:ficar/Views/data/write.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class AdminPanel2 extends StatefulWidget {
  const AdminPanel2({Key? key}) : super(key: key);

  @override
  State<AdminPanel2> createState() => _AdminPanel2State();
}

class _AdminPanel2State extends State<AdminPanel2> {



  @override
  Widget build(BuildContext context) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("dailyspecial");

   

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Admin',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                try {
                  await ref.set({
                    "name": "Joh",
                    "age": 20,
                    "address": {"line1": "100 Mountain View"}
                  });
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Read examples'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => Write()),
                  ),
                );

                // try {
                //   // ref2.onValue.listen((DatabaseEvent event) {
                //   //   final data3 = event.snapshot.value;
                //   //   print(data3);
                //   //   log(data3.toString());
                //   //   setState(() {
                //   //     _displyText = 'text $data3';
                //   //   });
                //   // });
                //   // DatabaseEvent  event = await ref2.once();
                //   // setState(() {
                //   //   // _displyText = event.snapshot.value.toString();
                //   // // });
                //   // log(event.snapshot.value.toString());
                // } catch (e) {
                //   print(e);
                // }
              },
              child: const Text('Write examples'),
            ),
            // Text(_displyText),
          ],
        ));
  }
}

Widget buildQuoteCard() => Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Parents control",
            ),
            SizedBox(height: 12),
            Text(
              "Add parent",
            ),
            Text(
              "View parents list",
            ),
          ],
        ),
      ),
    );
