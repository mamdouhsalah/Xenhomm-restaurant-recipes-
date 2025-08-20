import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RandemRecipeScreen extends StatefulWidget {
  const RandemRecipeScreen({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<RandemRecipeScreen> createState() => _RandemRecipeScreenState();
}

class _RandemRecipeScreenState extends State<RandemRecipeScreen> {
  List recipes = [];
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
    getData();
  }

  Future<void> getData() async {
    Dio dio = Dio();
    var response = await dio.get('https://dummyjson.com/recipes');
    setState(() {
      recipes = response.data['recipes'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipe = recipes.isNotEmpty ? recipes[currentIndex ?? 0] : {};

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: recipes.isNotEmpty
            ? BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(recipe['image'].toString()),
                  fit: BoxFit.cover,
                ),
              )
            : null,
        child: recipes.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 12, 177, 122),
                ),
              )
            : Padding(
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
                                recipe['image'],
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
                            Positioned(
                              bottom: 20,
                              left: 20,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.navigate_before_outlined,
                                  color: Color.fromARGB(255, 12, 177, 122),
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (recipes.isNotEmpty) {
                                      currentIndex =
                                          ((currentIndex ?? 0) -
                                              1 +
                                              recipes.length) %
                                          recipes.length;
                                    }
                                  });
                                },
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.navigate_next_outlined,
                                  color: Color.fromARGB(255, 12, 177, 122),
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (recipes.isNotEmpty) {
                                      currentIndex =
                                          ((currentIndex ?? 0) + 1) %
                                          recipes.length;
                                    }
                                  });
                                },
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
                                recipe['name'],
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
                                        'meal Type: ${recipe['mealType']}',
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
                                        'cook time: ${recipe['cookTimeMinutes']} min',
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
                                        'difficulty: ${recipe['difficulty']}',
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
                                  recipe['instructions'].length,
                                  (i) => Text(
                                    "- ${recipe['instructions'][i]}",
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
                                  recipe['ingredients'].length,
                                  (i) => Text(
                                    "- ${recipe['ingredients'][i]}",
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
