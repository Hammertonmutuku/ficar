// ignore_for_file: use_key_in_widget_constructors

import 'dart:async';
import 'package:ficar/components/HomeMap/driver_map_info.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ficar/components/HomeMap/user_badge.dart';

class HomeMap extends StatefulWidget {
  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {

  late final TextEditingController _startController;
  late final TextEditingController _DestinationController;
  // important variables
  Location location = Location();
  StreamSubscription<LocationData>? _locationSubscription;

 

  //getting the currentLocation
  
  late LatLng currentLocation;
  // a reference to the destination location
  late LatLng destinationLocation;
  // creating an instance of the map
  final Completer<GoogleMapController> _controller = Completer();
  // source location and destination
    LatLng initialLocation = const LatLng(-1.2733343391784984, 36.848867420132095);
  LatLng destLocation = const LatLng(-1.2829128937167285, 36.874647094633495);

  //markers icon
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  final Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  //camera
  double cameraZoom = 16;
  double cameraTilt = 80;
  double cameraBearing = 30;

    bool _added = false;
    

  @override
  void initState()   {

    _startController =  TextEditingController();
    _DestinationController =  TextEditingController();

    super.initState();

    //check if location is open
    requestUserLocation();
    //Set the initialLocation

    //moving location
  //   location.onLocationChanged.listen((LocationData currentLoc) {
  //    currentLocation2 = currentLoc;
  //  });
    setInitialLocation();
    //set up the marker icons4
    setSourceAndDestinationMarkersIcons();
  }

 @override
  void dispose() {
    _startController.dispose();
    _DestinationController.dispose();
    super.dispose();
  }
  //Method to request user location from phone
  void requestUserLocation() async {
    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

// method to set intial location
  void setInitialLocation() async {
    LocationData locationData1 = await location.getLocation();
    currentLocation = LatLng(locationData1.latitude!, locationData1.longitude!);
    destinationLocation = LatLng(destLocation.latitude, destLocation.longitude);
  }

// method to set markets
  void setSourceAndDestinationMarkersIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.0),
      'assets/images/driving_pin.png',
    );
    destinationIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.0),
      'assets/images/destination_map_marker.png',
    );
  }

  void liveLocation() {
       location =  Location();
       location.onLocationChanged.listen((LocationData currentLocation) {
 
   });

  }

  void showPinsOnMap() {
    // add the initial source location pin
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: currentLocation,
        icon: sourceIcon));
    // destination pin
    _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: destinationLocation,
        icon: destinationIcon));
       _markers.add(Marker(
        markerId: MarkerId('destP'),
        position: initialLocation,
        icon: destinationIcon));
  }





  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: cameraZoom,
      tilt: cameraTilt,
      bearing: cameraBearing,
      target: currentLocation,
    );
    return Scaffold(
      body: Container(
            child: Stack(children: [
              Positioned.fill(
                child: GoogleMap(
                  myLocationEnabled: false,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  tiltGesturesEnabled: false,
                  markers: _markers,
                  polylines: _polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                    showPinsOnMap();
                    _added = true;
                  },
                ),
              ),
               Positioned(
                top: 30,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                   Row(
                    children: [
                      
                    ],
                   )
                  ],
                ),
              ),
              const Positioned(
                  left: 0, right: 0, bottom: 20, child: DriverMapInfo()),
            ]),
          )
        
      
    );
  }
}
