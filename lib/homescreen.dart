import 'package:flutter/material.dart';
import 'package:ifstatic_technologies_assignment/screens/main_screen.dart';
import 'package:ifstatic_technologies_assignment/widgets/searchfooditems.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              MainScreen(),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffc90000),
        onPressed: () {},
        child: Image.asset("assets/icons/scan.png"),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0,right:1),
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/home.png",
                    height: 27,
                    width: 24,

                  ),
                  Text(
                    'Home',
                    style:  TextStyle(
                      fontSize:  9,
                      fontWeight:  FontWeight.w600,
                      height:  1.2125,
                      color:  Color(0xffc90000),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              "assets/icons/recipe.png",
              height: 24,
              width: 24,
            ),
            Image.asset(
              "assets/icons/Bookmark.png",
              height: 24,
              width: 24,
            ),
            Image.asset(
              "assets/icons/user.png",
              height: 24,
              width: 24,
            ),
          ],
        ),
      ),
    );
  }
}
