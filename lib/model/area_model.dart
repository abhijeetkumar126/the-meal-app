class AreaModel {
  final String strArea;
  AreaModel({
    required this.strArea,
  });

  factory AreaModel.fromMap(Map<String, dynamic> map) {
    return AreaModel(
      strArea: map['strArea'] as String,
    );
  }
}
