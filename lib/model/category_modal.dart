class CategoryModal {
  final String strCategory;
  CategoryModal({
    required this.strCategory,
  });

  factory CategoryModal.fromMap(Map<String, dynamic> map) {
    return CategoryModal(
      strCategory: map['strCategory'] as String,
    );
  }
}
