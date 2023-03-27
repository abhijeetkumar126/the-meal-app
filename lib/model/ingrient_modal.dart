class IngrientModal {
  final String idIngredient;
  final String? strIngredient;
  final String? strDescription;

  IngrientModal({
    required this.idIngredient,
    required this.strDescription,
    required this.strIngredient,
  });

  factory IngrientModal.fromMap(Map<String, dynamic> json) {
    return IngrientModal(
      idIngredient: json['idIngredient'],
      strDescription: json['strDescription'],
      strIngredient: json['strIngredient'],
    );
  }
}
