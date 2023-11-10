import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedCategoryIndex =4;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 56.0,
          left: 14.0,
          child: InkWell(
            onTap: () {
            // Set the selected index and trigger a rebuild
            setState(() {
              selectedCategoryIndex = 0;
            });
          },
            child: Container(
              height: 39,
              width: 47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: selectedCategoryIndex == 0 ? Color(0xffff5858) : Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Container(alignment: Alignment.center,
                  child: Text(
                    "All"
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 56.0,
          left: 72.0,
          child: InkWell(
            onTap: () {
              // Set the selected index and trigger a rebuild
              setState(() {
                selectedCategoryIndex = 1;
              });
            },
            child: Container(
              height: 39, // Adjusted height to accommodate the image and text
              width: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: selectedCategoryIndex == 1 ? Color(0xffff5858) : Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 30,
                      image: AssetImage("assets/icons/pizza.png"),
                    ),
                     // Adjust the spacing between image and text
                    Text(
                      'Pizza',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: selectedCategoryIndex == 1 ? Colors.white : Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 57.0,
          left: 165.0,
          child: InkWell(onTap: () {
            // Set the selected index and trigger a rebuild
            setState(() {
              selectedCategoryIndex = 2;
            });
          },

            child: Container(
              height: 39,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: selectedCategoryIndex == 2 ? Color(0xffff5858) : Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Container(alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/icons/chicken.png')),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 57.0,
          left: 235.0,
          child: InkWell(onTap: () {
            // Set the selected index and trigger a rebuild
            setState(() {
              selectedCategoryIndex = 3;
            });
          },

            child: Container(
              height: 39,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: selectedCategoryIndex == 3 ? Color(0xffff5858): Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Container(alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/icons/salad.png')),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 57.0,
          left: 304.0,
          child: InkWell(
            onTap: () {
              // Set the selected index and trigger a rebuild
              setState(() {
                selectedCategoryIndex = 4;
              });
            },
            child: Container(
              height: 39,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80),
                color: selectedCategoryIndex == 4 ? Color(0xffff5858): Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Container(alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/icons/burger.png')),
                ),
              ),
            ),
          ),
        ),


      ],
    );
  }
}
