import 'package:flutter_app/models/meal.dart';

class SelectMealsState {
  final List<Meal> meals;
  SelectMealsState({
    this.meals,
  });
}

class MealsLoading extends SelectMealsState {
  final List<Meal> meals;
  MealsLoading({this.meals});
  @override
  String toString() => 'MealsLoading';

  @override
  List<Object> get props => [meals];
}

class DisplayMeals extends SelectMealsState {
  final List<Meal> meals;
  DisplayMeals({
    this.meals,
  });
  @override
  String toString() => 'DisplayMeals';

  @override
  List<Object> get props => [meals];
}

class LoadMealsError extends SelectMealsState {
  final List<Meal> meals;
  LoadMealsError({this.meals});
  @override
  String toString() => 'LoadMealsError';

  @override
  List<Object> get props => [meals];
}
