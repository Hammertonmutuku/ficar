import 'dart:async';

import 'package:ficar/Constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer' as devtools show log;

import 'package:location/location.dart';

class HomeMap2 extends StatefulWidget {
  const HomeMap2({Key? key}) : super(key: key);

  @override
  State<HomeMap2> createState() => _HomeMap2State();
}

class _HomeMap2State extends State<HomeMap2> {
  final Completer<GoogleMapController> _controller = Completer();

  static LatLng sourceLocation =
      const LatLng(-1.2733343391784984, 36.848867420132095);
  static LatLng destination =
      const LatLng(-1.2829128937167285, 36.874647094633495);

  Set<Polyline> _polyline = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
   LocationData? currentLocation;
   

  void getCurrentLocation()  async {
   Location location = Location();

   try{
    currentLocation = await location.getLocation();
   } on PlatformException catch (e) {
    if (e.code ==  'PERMISSION_DENIED') {
    
    }
   }
    // location.getLocation().then((location) {
    //   currentLocation = location;
    // });
  }

  void setPolylines() async {
    PolylineResult results = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyBGxyKv4HnLcXg91hQtDYjoB942OmgX058",
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));


    if (results.status == 'OK') {
      results.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });

      setState(() {
        _polyline.add(Polyline(
            width: 5,
            polylineId: PolylineId('polyLine'),
            color: kPrimaryColor,
            points: polylineCoordinates));
      });
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  
    polylinePoints = PolylinePoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentLocation == null
          ? const Center(
              child: Text('Loading'),
            )
          : GoogleMap(
              myLocationEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: 12.5,
              ),
              polylines: _polyline,
              markers: {
                Marker(
                  markerId: MarkerId('currentLocation'),
                  position: LatLng(
                      currentLocation!.latitude!, currentLocation!.longitude!),
                ),
                Marker(
                  markerId: MarkerId('source'),
                  position: sourceLocation,
                ),
                Marker(
                  markerId: MarkerId('destination'),
                  position: destination,
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                  
                setPolylines();
              }),
    );
  }
}
