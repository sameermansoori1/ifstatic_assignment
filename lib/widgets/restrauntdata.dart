import 'package:flutter/material.dart';

class Restaurant {
  final int id;
  final String name;
  final String tags;
  final double rating;
  final int discount;
  final String imageUrl;
  final double distance;

  Restaurant({
    required this.id,
    required this.name,
    required this.tags,
    required this.rating,
    required this.discount,
    required this.imageUrl,
    required this.distance,
  });
}

class Restaurants extends StatefulWidget {
  final Restaurant restaurant;

  const Restaurants({Key? key, required this.restaurant}) : super(key: key);

  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 220, left: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 346,
            height: 185,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(3, 5),
                  blurRadius: 4,
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
                      image: NetworkImage(widget.restaurant.imageUrl),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Align(
                      child: SizedBox(
                        width: 34,
                        height: 20,
                        child: Image.asset(
                          'assets/icons/rating.png',
                          width: 34,
                          height: 20,
                          alignment: Alignment(5, 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  height: 53,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 2, 78, 19),
                        child: Text(
                          widget.restaurant.name,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                              width: 27,
                              height: 27,
                              child: Image.asset("assets/icons/Discount.png"),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                              child: Text(
                                '${widget.restaurant.discount}% FLAT OFF',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Color(0xffff0000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 346,
            height: 185,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(3, 5),
                  blurRadius: 4,
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
                      image: AssetImage("assets/images/Intersect.png"),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Align(
                      child: SizedBox(
                        width: 33,
                        height: 20,
                        child: Image.asset(
                          'assets/icons/rating.png',
                          width: 33,
                          height: 20,
                          alignment: Alignment(5, 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  height: 53,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(5),
                  ),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                              width: 27,
                              height: 27,
                              child: Image.asset("assets/icons/Discount.png"),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                              child: Text(
                                '${widget.restaurant.discount}% FLAT OFF',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Color(0xffff0000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 346,
            height: 185,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x3f000000),
                  offset: Offset(3, 5),
                  blurRadius: 4,
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
                      image: NetworkImage(widget.restaurant.imageUrl),
                    ),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: Align(
                      child: SizedBox(
                        width: 34,
                        height: 20,
                        child: Image.asset(
                          'assets/icons/rating.png',
                          width: 34,
                          height: 20,
                          alignment: Alignment(5, 2),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 330,
                  height: 53,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(7, 2, 78, 19),
                        child: Text(
                          widget.restaurant.name,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 4, 0),
                              width: 27,
                              height: 27,
                              child: Image.asset("assets/icons/Discount.png"),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                              child: Text(
                                '${widget.restaurant.discount}% FLAT OFF',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.5,
                                  color: Color(0xffff0000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}