import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class DriverMapInfo extends StatefulWidget {
  const DriverMapInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverMapInfo> createState() => _DriverMapInfoState();
}

class _DriverMapInfoState extends State<DriverMapInfo> {
  @override
  Widget build(BuildContext context) {
     //variable for start and stop for the driver
  bool pressStart = false;
  bool pressStop = false;

  Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;

    Future<void> listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((LocationData currentlocation) async {
      final _currentLatitude = currentlocation.latitude;
      final _currentLongitude = currentlocation.longitude;
      try {
        await FirebaseDatabase.instance.ref("Location").set({
          "name": " john",
          "latitude": "$_currentLatitude",
          "longitude": "$_currentLongitude"
        });
      } catch (e) {}
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }
 

    return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/avatar.png'),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hammerton Mutuku',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'KBY 624L',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '6 children on board',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: () async {
                            // listenLocation();
                            final yes = await startStopTrip(context);
                            if (yes) {
                              setState(() {
                                pressStart = !pressStart;
                                pressStop = !pressStop;
                              });
                            }
                            // if (pressStart) {
                            //   listenLocation();
                            // }else {
                            //   _stopListening();
                            // }
                          },
                          child: pressStop
                              ? const Text("Start Trip")
                              : const Text("End Trip"),
                          color: pressStart ? Colors.blue : Colors.red,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ],
                    ),
                  );


  }
}
Future<bool> startStopTrip(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Confirm Intention'),
        content: const Text('Are you sure you want to complete this action'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('Yes,sure '),
          )
        ],
      );
    },
  ).then((value) => value ?? false);
}
