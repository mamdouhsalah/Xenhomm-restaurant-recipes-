import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/favorate_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/profile_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/recipes_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/widget/custom_widget.dart';
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
      backgroundColor: const Color(0xffFFFFFF),

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 28,
        ),
        backgroundColor: const Color(0xFF0C8A68),
        title: const Text(
          'Hello: mamdouh',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Pacifico',
          ),
        ),
        actions: const [
          SizedBox(width: 10),
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.supervised_user_circle, color: Colors.white),
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
        selectedItemColor: Color(0xFF0C8A68),
        unselectedItemColor: Color.fromARGB(255, 141, 182, 170),
        selectedFontSize: 14,
        unselectedFontSize: 12,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_rounded, size: 26),
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
