// recipes_state.dart
part of 'recipes_cubit.dart';

@immutable
sealed class RecipesState {}

final class RecipesInitial extends RecipesState {}

final class RecipesLoading extends RecipesState {}

final class RecipessSuccess extends RecipesState {
  final List<RecipeModel> recipes;
  RecipessSuccess({required this.recipes});
}

final class RecipesError extends RecipesState {
  final String message;
  RecipesError({required this.message});
}
