// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_interpolation_to_compose_strings, unused_local_variable

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../resources/app_localization.dart';

class LocationScreen extends StatefulWidget {
  static String route = "/location_screen";
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _position = CameraPosition(
      target: LatLng(
        31.4564555,
        74.2848167,
      ),
      zoom: 14);
  List<Marker> _marker = [];
  @override
  void initState() {
    super.initState();
    getUserCurrentLocation().then((value) async {
      log(value.latitude.toString() + " " + value.longitude.toString());
      _marker.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: InfoWindow(
              title: LocalizationMap.getValues('current_location'))));
      CameraPosition cameraPosition =
          CameraPosition(target: LatLng(value.latitude, value.longitude));
      setState(() {});
    });
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      log("Error" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _position,
        mapType: MapType.normal,
        compassEnabled: true,
        markers: Set<Marker>.of(_marker),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
