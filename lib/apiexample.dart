import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Restaurant {
  final int id;
  final String name;
  final String tags;
  final double rating;
  final int discount;
  final String primaryImage;
  final double distance;

  Restaurant({
    required this.id,
    required this.name,
    required this.tags,
    required this.rating,
    required this.discount,
    required this.primaryImage,
    required this.distance,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      tags: json['tags'],
      rating: json['rating'].toDouble(),
      discount: json['discount'],
      primaryImage: json['primary_image'],
      distance: json['distance'].toDouble(),
    );
  }
}

class ApiExample extends StatefulWidget {
  @override
  _ApiExampleState createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  late List<Restaurant> restaurants;

  @override
  void initState() {
    super.initState();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    final url = Uri.parse('https://theoptimiz.com/restro/public/api/get_resturants');
    final response = await http.post(
      url,
      body: jsonEncode({'lat': 25.22, 'lng': 45.32}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      if (jsonResponse['status'] == 'SUCCESS' && jsonResponse['code'] == 'SC_01') {
        final List<dynamic> data = jsonResponse['data'];
        setState(() {
          restaurants = data.map((item) => Restaurant.fromJson(item)).toList();
        });
      } else {
        // Handle API error
        print('API error: ${jsonResponse['status']} - ${jsonResponse['code']}');
      }
    } else {
      // Handle HTTP error
      print('HTTP error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: restaurants != null
          ? ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index];
          return ListTile(
            title: Text(restaurant.name),
            subtitle: Text('Rating: ${restaurant.rating} | Discount: ${restaurant.discount}%'),
          );
        },
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ApiExample(),
  ));
}
