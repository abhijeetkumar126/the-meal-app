class MealDetailModel {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String? strTags;
  final String strYoutube;
  MealDetailModel({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
  });

  factory MealDetailModel.fromMap(Map<String, dynamic> map) {
    return MealDetailModel(
      idMeal: map['idMeal'] as String,
      strMeal: map['strMeal'] as String,
      strCategory: map['strCategory'] as String,
      strArea: map['strArea'] as String,
      strInstructions: map['strInstructions'] as String,
      strMealThumb: map['strMealThumb'] as String,
      strTags: map['strTags'] as String?,
      strYoutube: map['strYoutube'] as String,
    );
  }
}
