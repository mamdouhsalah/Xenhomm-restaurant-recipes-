import 'package:flutter/material.dart';

class CustomRecipes extends StatelessWidget {
  const CustomRecipes({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.mealType,
    required this.cookTimeMinutes,
    required this.difficulty,
    required this.instructions,
    required this.ingredients,
  });

  final String imageUrl;
  final String title;
  final dynamic mealType;
  final int cookTimeMinutes;
  final String difficulty;
  final List<dynamic> instructions;
  final List<dynamic> ingredients;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: Colors.white.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromARGB(255, 12, 177, 122),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Color.fromARGB(255, 12, 177, 122),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontFamily: 'Pacifico',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),

                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 6,
                          childAspectRatio: 1.2,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  'meal Type: $mealType',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  'cook time: $cookTimeMinutes min',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text(
                                  'difficulty: $difficulty',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'Instructions',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            instructions.length,
                            (i) => Text(
                              "- ${instructions[i]}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            ingredients.length,
                            (i) => Text(
                              "- ${ingredients[i]}",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'watch video',
                    style: TextStyle(
                      color: Color.fromARGB(255, 12, 177, 122),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
