import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/custom_recipes.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double rating;
  final int lessons;
  final int cookTimeMinutes;

  final dynamic mealType;
  final String difficulty;
  final List<dynamic> instructions;
  final List<dynamic> ingredients;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.lessons,
    required this.cookTimeMinutes,
    this.mealType,
    required this.difficulty,
    required this.instructions,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomRecipes(
                imageUrl: imageUrl,
                mealType: mealType,
                difficulty: difficulty,
                instructions: instructions,
                ingredients: ingredients,
                title: title,
                cookTimeMinutes: cookTimeMinutes,
              ),
            ),
          );
        },
        child: Card(
          color: ColorStyle.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Textstyle.text16Balck,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: ColorStyle.amberColor,
                          size: 16,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          rating.toStringAsFixed(1),
                          style: Textstyle.text16Balck.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text("$lessons servings", style: Textstyle.text14grey),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(
                          Icons.video_library_rounded,
                          color: ColorStyle.greenColor,
                        ),
                        Spacer(),
                        Icon(Icons.access_time, size: 16),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
