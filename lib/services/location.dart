import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geocoding/geocoding.dart';
class LocationLatLng extends StatefulWidget {
  const LocationLatLng({super.key});

  @override
  State<LocationLatLng> createState() => _LocationLatLngState();
}

class _LocationLatLngState extends State<LocationLatLng> {
  @override

  String address = "";
  double ?lat;
  double ?long ;
  @override
  void initState() {
    super.initState();
    getLatLong();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLatLong() {
    Future<Position> data = _determinePosition();
    data.then((value) {
      print("value $value");
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });

      getAddress(value.latitude, value.longitude);
    }).catchError((error) {
      print("Error $error");
    });
  }
  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState(() {
      address = placemarks[0].street! + " " + placemarks[0].country!;
    });

    for (int i = 0; i < placemarks.length; i++) {
      print("INDEX $i ${placemarks[i]}");
    }
  }

  Widget build(BuildContext context) {
    return Positioned(
      left: 122,
      top: 24,
      child: Align(
        child: SizedBox(
          width: 154,
          height: 21,

              child: Text(
                  '$address',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.67,
                  color: Color(0xff000000),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

      );

  }
}
