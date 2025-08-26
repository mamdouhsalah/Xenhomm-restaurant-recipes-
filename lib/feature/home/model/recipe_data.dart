import 'package:Xenhomm_restaurant_Recipes/feature/home/model/recipe_model.dart';
import 'package:dio/dio.dart';

class RecipeData {
  final Dio dio = Dio();

  getRecipes() async {
    var response = await dio.get('https://dummyjson.com/recipes');
    List data = response.data['recipes'];
    List<RecipeModel> list = data.map((e) => RecipeModel.fromJson(e)).toList();

    print(list[0].image);

    return list;
  }
}
