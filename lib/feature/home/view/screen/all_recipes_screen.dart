import 'package:Xenhomm_restaurant_Recipes/core/manger/style/colorStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/core/manger/style/textStyle.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/view/widget/custom_infoBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/cubit/recipes_cubit.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/model/recipe_model.dart';

class RandemRecipeScreen extends StatefulWidget {
  const RandemRecipeScreen({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<RandemRecipeScreen> createState() => _RandemRecipeScreenState();
}

class _RandemRecipeScreenState extends State<RandemRecipeScreen> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          if (state is RecipesLoading) {
            return const Center(
              child: CircularProgressIndicator(color: ColorStyle.greenColor),
            );
          } else if (state is RecipessSuccess) {
            final recipes = state.recipes;
            if (recipes.isEmpty) {
              return const Center(child: Text("No recipes available"));
            }

            final RecipeModel recipe = recipes[currentIndex ?? 0];

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(recipe.image),
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
                                recipe.image,
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
                                  color: ColorStyle.greenColor,
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
                                  color: ColorStyle.greenColor,
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
                                  color: ColorStyle.greenColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentIndex =
                                        ((currentIndex ?? 0) -
                                            1 +
                                            recipes.length) %
                                        recipes.length;
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
                                  color: ColorStyle.greenColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    currentIndex =
                                        ((currentIndex ?? 0) + 1) %
                                        recipes.length;
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
                                recipe.name,
                                style: Textstyle.text20BalckBolod.copyWith(
                                  fontFamily: 'Pacifico',
                                ),
                              ),

                              GridView.count(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 3,
                                crossAxisSpacing: 6,
                                childAspectRatio: 1.2,
                                children: [
                                  infoBox(
                                    "Meal Type",
                                    recipe.mealType.toString(),
                                    ColorStyle.greenColor100,
                                  ),
                                  infoBox(
                                    "Cook Time",
                                    "${recipe.cookTimeMinutes} min",
                                    ColorStyle.orangeColor100,
                                  ),
                                  infoBox(
                                    "Difficulty",
                                    recipe.difficulty,
                                    ColorStyle.purpelColor100,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              Text(
                                'Instructions',
                                style: Textstyle.text20BalckBolod,
                              ),
                              const SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: recipe.instructions
                                    .map(
                                      (i) => Text(
                                        "- $i",
                                        style: Textstyle.text16Balck,
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 16),

                              const Text(
                                'Ingredients',
                                style: Textstyle.text20BalckBolod,
                              ),
                              const SizedBox(height: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: recipe.ingredients
                                    .map(
                                      (i) => Text(
                                        "- $i",
                                        style: Textstyle.text16Balck,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'watch video',
                          style: TextStyle(color: ColorStyle.greenColor),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: Text("Error loading recipe"));
          }
        },
      ),
    );
  }
}
