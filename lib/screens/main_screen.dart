import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ifstatic_technologies_assignment/widgets/categories.dart';
import 'package:ifstatic_technologies_assignment/widgets/restrauntdata.dart';
import 'package:ifstatic_technologies_assignment/widgets/searchfooditems.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Restaurant> restaurants = [
    Restaurant(
      id: 5,
      name: "Kake Da Hotel",
      tags: "Chicken, Naan",
      rating: 4.9,
      discount: 20,
      imageUrl: "https://theoptimiz.com/restro/public/Resturants/kake-da-hotel.png",
      distance: 6286.79,
    ),
    // Add more restaurants as needed
  ];
  String currentAddress = '';

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      _getCurrentLocation();
    } else {
      // Handle the case where the user denies permission
      print('Location permission denied');
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        setState(() {
          currentAddress =
          '${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}';
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 167),
          width: double.infinity,
          height: 1000,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: Align(
                  child: SizedBox(
                    width: double.infinity,
                    height: 900,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(-0, -0.8),
                          end: Alignment(-0.011, 1),
                          colors: [Color(0xffffe1e1), Color(0x00ffdfdf)],
                          stops: [0, 1],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                left: 122,
                top: 24,
                child: Align(
                  child: SizedBox(
                    width: 154,
                    height: 21,
                    child: Text(
                      'Alpha 1,Greater Noida $currentAddress',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        color: Color(0xff000000),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              //Location
              Positioned(
                // locationonFKH (552:6)
                left: 99,
                top: 27,
                child: Align(
                  child: SizedBox(
                    width: 19,
                    height: 19,
                    child: Image.asset(
                      'assets/icons/Location.png',
                      width: 19,
                      height: 19,
                    ),
                  ),
                ),
              ), //locationicon
              Positioned(
                // nearbyrestaurants
                left: 15,
                top: 187,
                child: Align(
                  child: SizedBox(
                    width: 150,
                    height: 20,
                    child: Text(
                      'Nearby Restaurants',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return Restaurants(restaurant: restaurants[index]);
                },
              ), //NearbyRestraunt
              Categories(),
              SearchFoodItems(searchController: SearchController()),

              //restraunt1
              Positioned(

                left: 7,
                top: 424,
                child: Container(
                  width: 345,
                  height: 185,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(4, 6),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(280, 98, 10, 12),
                          width: 330,
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/Intersect.png"))),

                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Align(
                                child: SizedBox(
                                  width: 32,
                                  height: 18,
                                  child: Image.asset(
                                    'assets/icons/rating.png',
                                    width: 32,
                                    height: 18,
                                    alignment: Alignment(5, 2),
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          width: 330,
                          height: 53,
                          decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(7, 2, 78, 19),
                                child: Text(
                                  'Domino’s Pizza',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  height: double.infinity,
                                  child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.fromLTRB(0, 0, 4, 0),
                                          width: 27,
                                          height: 27,
                                          child: Image.asset(
                                              "assets/icons/Discount.png"),
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 1),
                                          child: Text(
                                            '20% FLAT OFF',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                              color: Color(0xffff0000),
                                            ),
                                          ),
                                        ),
                                      ])),
                            ],
                          ),
                        )
                      ]),
                ),
              ), //restraunt2
              Positioned(
                left: 7,
                top: 630,
                child: Container(
                  width: 346,
                  height: 185,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(4, 6),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(285, 98, 11, 12),
                          width: 330,
                          height: 130,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      "assets/images/Intersect.png"))),

                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Align(
                                child: SizedBox(
                                  width: 32,
                                  height: 18,
                                  child: Image.asset(
                                    'assets/icons/rating.png',
                                    width: 32,
                                    height: 18,
                                    alignment: Alignment(5, 2),
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          width: 330,
                          height: 53,
                          decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(7, 2, 78, 19),
                                child: Text(
                                  'Domino’s Pizza',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  height: double.infinity,
                                  child: Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                          EdgeInsets.fromLTRB(0, 0, 4, 0),
                                          width: 27,
                                          height: 27,
                                          child: Image.asset(
                                              "assets/icons/Discount.png"),
                                        ),
                                        Container(
                                          margin:
                                          EdgeInsets.fromLTRB(0, 0, 0, 1),
                                          child: Text(
                                            '20% FLAT OFF',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              height: 1.5,
                                              color: Color(0xffff0000),
                                            ),
                                          ),
                                        ),
                                      ])),
                            ],
                          ),
                        )
                      ]),
                ),
              ), //restraunt3
            ],
          ),
        ),
      ],
    );
  }
}

