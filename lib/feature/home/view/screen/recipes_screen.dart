import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/randem_recipe_screen.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  Future<List> getData() async {
    Dio dio = Dio();
    var response = await dio.get('https://dummyjson.com/recipes');
    return response.data['recipes'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 12, 177, 122),
              ),
            );
          }
          final recipes = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What would you like to cook today?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      const Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "See all",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 29, 170, 123),
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
                        CategoryCard(title: "Lunch", icon: Icons.lunch_dining),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See all",
                          style: TextStyle(color: Colors.green),
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
                        final recipe = recipes[index];
                        return RecipeCard(
                          cookTimeMinutes: recipe['cookTimeMinutes'],
                          mealType: recipe['mealType'],
                          difficulty: recipe['difficulty'],
                          instructions: recipe['instructions'],
                          ingredients: recipe['ingredients'],
                          imageUrl: recipe["image"],
                          title: recipe["name"],
                          rating: recipe["rating"]?.toDouble() ?? 0.0,
                          lessons: recipe["servings"],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RandemRecipeScreen(currentIndex: 0),
                          ),
                        );
                      },
                      child: Text(
                        'all recipes',
                        style: TextStyle(
                          color: Color.fromARGB(255, 12, 177, 122),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
