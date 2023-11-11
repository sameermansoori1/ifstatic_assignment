import 'package:flutter/material.dart';



class SearchFoodItems extends StatefulWidget {
  final TextEditingController searchController;

  const SearchFoodItems({required this.searchController, Key? key}) : super(key: key);

  @override
  _SearchFoodItemsState createState() => _SearchFoodItemsState();
}

class _SearchFoodItemsState extends State<SearchFoodItems> {

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






