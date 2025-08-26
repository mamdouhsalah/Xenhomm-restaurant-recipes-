import 'package:Xenhomm_restaurant_Recipes/feature/home/model/recipe_data.dart';
import 'package:Xenhomm_restaurant_Recipes/feature/home/model/recipe_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesInitial());

  RecipeData recipe = RecipeData();

  getDataCubit() async {
    emit(RecipesLoading());
    try {
      final data = await recipe.getRecipes();
      emit(RecipessSuccess(recipes: data));
    } catch (e) {
      emit(RecipesError(message: e.toString()));
    }
  }
}
