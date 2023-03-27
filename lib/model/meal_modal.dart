class MealModal {
  final String strMeal;
  final String? strMealThumb;
  final String idMeal;
  MealModal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory MealModal.fromMap(Map<String, dynamic> map) {
    return MealModal(
      strMeal: map['strMeal'] as String,
      strMealThumb: map['strMealThumb'] as String?,
      idMeal: map['idMeal'] as String,
    );
  }
}
