abstract class SelectMealsEvent {}

class GetMeals extends SelectMealsEvent {
  @override
  String toString() => 'GetMeals';
}