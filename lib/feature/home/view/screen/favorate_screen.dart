import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:flutter/material.dart';

class FavoriteRecipesScreen extends StatefulWidget {
  const FavoriteRecipesScreen({super.key});

  @override
  State<FavoriteRecipesScreen> createState() => _FavoriteRecipesScreenState();
}

class _FavoriteRecipesScreenState extends State<FavoriteRecipesScreen> {
  late List<Map<String, dynamic>> favoriteRecipes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.whiteColor,
      body: Center(
        child: Text(
          "No favorite recipes yet ❤️",
          style: Textstyle.text16BalckBolod.copyWith(fontSize: 20),
        ),
      ),
    );
  }
}
