import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifstatic_technologies_assignment/services/location.dart';

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
    ),//done
    // Add more restaurants as needed
  ];

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

              LocationLatLng(),
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
                shrinkWrap: true, // This is important!
                physics: NeverScrollableScrollPhysics(),
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  return Restaurants(restaurant: restaurants[index]);
                },
              ), //NearbyRestraunt
              Categories(),
              SearchFoodItems(searchController: SearchController()),

            ],
          ),
        ),
      ],
    );
  }
}

