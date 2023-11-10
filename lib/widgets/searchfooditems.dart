import 'package:flutter/material.dart';

class Restaurantt {
  final int id;
  final String name;
  final String tags;
  final double rating;
  final int discount;
  final String imageUrl;
  final double distance;

  Restaurantt({
    required this.id,
    required this.name,
    required this.tags,
    required this.rating,
    required this.discount,
    required this.imageUrl,
    required this.distance,
  });
}

class SearchFoodItems extends StatefulWidget {
  final TextEditingController searchController; // Add this line

  const SearchFoodItems({required this.searchController, Key? key}) : super(key: key);

  @override
  _SearchFoodItemsState createState() => _SearchFoodItemsState();
}

class _SearchFoodItemsState extends State<SearchFoodItems> {
  late List<Restaurantt> restaurants;
  late List<Restaurantt> displayedRestaurants;

  @override
  void initState() {
    super.initState();
    // Initialize the restaurants list (you can fetch this from the API)
    restaurants = [
      Restaurantt(
        id: 5,
        name: 'Domino’s Pizza',
        tags: 'Chicken, Naan',
        rating: 4.9,
        discount: 20,
        imageUrl: 'assets/images/Intersect.png',
        distance: 6286.79,
      ),
      // Add more restaurants here...
    ];

    // Initially, displayed restaurants are the same as all restaurants
    displayedRestaurants = List.from(restaurants);
  }

  void searchRestaurants(String query) {
    setState(() {
      displayedRestaurants = restaurants
          .where((restaurant) =>
          restaurant.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 116.0,
      left: 16,
      child: Container(
        height: 51.0,
        width: 344,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.5),
          color: Color(0xffffffff),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 25,
                height: 25,
                child: Image.asset(
                  'assets/icons/Search.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                controller: widget.searchController ,
                onChanged: (query) => searchRestaurants(query),
                decoration: InputDecoration(
                  hintText: 'Search Food Items',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    height: 1.5,
                    color: Color(0xff6c6c6c),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



