import 'package:Xenhomm_restaurant_Recipes/feature/home/view/screen/custom_recipes.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 30, color: Colors.green[800]),
            const SizedBox(height: 6),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 3),
                        Text(
                          rating.toStringAsFixed(1),
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$lessons servings",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(
                          Icons.video_library_rounded,
                          color: Color.fromARGB(255, 12, 177, 122),
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

class Customdriwer extends StatelessWidget {
  const Customdriwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF0C8A68),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF0C8A68)),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Color(0xFF0C8A68)),
              ),
              accountName: const Text(
                "Hello, mamdouh",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'pacifico',
                ),
              ),
              accountEmail: const Text("mamdouhsalah631@gmail.com"),
            ),

            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text("Home", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Text(
                "Favorites",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.white),
              title: const Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
