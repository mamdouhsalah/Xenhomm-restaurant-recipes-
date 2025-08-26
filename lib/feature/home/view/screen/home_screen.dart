import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/favorate_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/profile_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/recipes_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/widget/Custom_driwer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      RecipesScreen(),
      ScreenProfile(),
      FavoriteRecipesScreen(),
    ];
    return Scaffold(
      backgroundColor: ColorStyle.whiteColor,

      appBar: AppBar(
        iconTheme: const IconThemeData(color: ColorStyle.whiteColor, size: 28),
        backgroundColor: ColorStyle.greenColor,
        title: Text(
          'Hello: mamdouh',
          style: Textstyle.text16Balck.copyWith(
            fontFamily: 'Pacifico',
            color: ColorStyle.whiteColor,
          ),
        ),
        actions: const [
          SizedBox(width: 10),
          Icon(Icons.search),
          SizedBox(width: 10),
          Icon(Icons.person),
          SizedBox(width: 10),
        ],
      ),
      drawer: Customdriwer(),

      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        elevation: 5,
        currentIndex: currentIndex,
        selectedItemColor: ColorStyle.greenColor,
        unselectedItemColor: ColorStyle.greyColor,
        selectedFontSize: 14,
        unselectedFontSize: 12,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 26),
            label: "profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 26),
            label: "Favorite",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
