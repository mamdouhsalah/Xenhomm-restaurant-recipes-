import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/all_recipes_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/widget/custom_CategoryCard.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/widget/custom_RecipeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/cubit/recipes_cubit.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/model/recipe_model.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: ColorStyle.whiteColor,
        body: BlocBuilder<RecipesCubit, RecipesState>(
          builder: (context, state) {
            if (state is RecipesLoading) {
              return const Center(
                child: CircularProgressIndicator(color: ColorStyle.greenColor),
              );
            } else if (state is RecipessSuccess) {
              final recipes = state.recipes;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'What would you like to cook today?',
                        style: Textstyle.text20BalckBolod,
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          const Text(
                            "Categories",
                            style: Textstyle.text20BalckBolod,
                          ),
                          const Spacer(),
                          const Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorStyle.greenColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 90,
                        child: GridView.count(
                          scrollDirection: Axis.horizontal,
                          crossAxisCount: 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.8,
                          children: const [
                            CategoryCard(
                              title: "Breakfast",
                              icon: Icons.free_breakfast,
                            ),
                            CategoryCard(
                              title: "Lunch",
                              icon: Icons.lunch_dining,
                            ),
                            CategoryCard(
                              title: "Dinner",
                              icon: Icons.dinner_dining,
                            ),
                            CategoryCard(title: "Dessert", icon: Icons.cake),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recommended",
                            style: Textstyle.text20BalckBolod,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "See all",
                              style: TextStyle(color: ColorStyle.greenColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      SizedBox(
                        height: 290,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: recipes.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1.6,
                                mainAxisSpacing: 12,
                              ),
                          itemBuilder: (context, index) {
                            final RecipeModel recipe = recipes[index];
                            return RecipeCard(
                              cookTimeMinutes: recipe.cookTimeMinutes.toInt(),
                              mealType: recipe.mealType,
                              difficulty: recipe.difficulty,
                              instructions: recipe.instructions,
                              ingredients: recipe.ingredients,
                              imageUrl: recipe.image,
                              title: recipe.name,
                              rating: recipe.rating.toDouble(),
                              lessons: recipe.servings.toInt(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorStyle.whiteColor,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RandemRecipeScreen(currentIndex: 0),
                              ),
                            );
                          },
                          child: const Text(
                            'all recipes',
                            style: TextStyle(
                              color: ColorStyle.greenColor,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is RecipesError) {
              return Center(child: Text("Error: ${state.message}"));
            } else {
              return const SizedBox();
            }
          },
        ),
      
    );
  }
}
