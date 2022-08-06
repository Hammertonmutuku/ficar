import 'dart:async';

import 'package:ficar/Constants/routes.dart';
import 'package:ficar/components/HomeMap/driver_map_info.dart';
import 'package:ficar/components/HomeMap/user_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeMap3 extends StatefulWidget {
  const HomeMap3({Key? key}) : super(key: key);

  @override
  State<HomeMap3> createState() => _HomeMap3State();
}

class _HomeMap3State extends State<HomeMap3> {
  final Completer<GoogleMapController> _controller = Completer();
  static LatLng sourceLocation =
      const LatLng(-1.2733343391784984, 36.848867420132095);
  static LatLng destination =
      const LatLng(-1.2829128937167285, 36.874647094633495);
  List<LatLng> polylineCordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();

    
    location.getLocation().then((location) {
      currentLocation = location;
    });
    GoogleMapController googleMapController = await _controller.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              ))));
      setState(() {});
    });
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyBGxyKv4HnLcXg91hQtDYjoB942OmgX058',
        PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      });
      setState(() {});
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children:[Positioned.fill(
            child: currentLocation == null
                ? const Center(
                    child: Text('loading'),
                  )
                : GoogleMap(
                   zoomControlsEnabled: false,
                   compassEnabled: false,
                   tiltGesturesEnabled: false,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                            currentLocation!.latitude!, currentLocation!.longitude!),
                        zoom: 13),
                    polylines: {
                      Polyline(
                          polylineId: const PolylineId("route"),
                          points: polylineCordinates,
                          color: kPrimaryColor,
                          width: 5),
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId('source'),
                        position: sourceLocation,
                      ),
                      Marker(
                        markerId: MarkerId('current location'),
                        position: LatLng(
                            currentLocation!.latitude!, currentLocation!.longitude!),
                      ),
                      Marker(
                        markerId: MarkerId('destination'),
                        position: destination,
                      ),
                    },
                    onMapCreated: (mapController) {
                      _controller.complete(mapController);
                    },
                  ),
          ),
          const Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: MapUserBadge(),
              ),
          const  Positioned(
                  left: 0, right: 0, bottom: 20, child: DriverMapInfo()),
          ] 
        ),
      ),
    );
  }
}
