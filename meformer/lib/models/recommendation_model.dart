class RecommendationModel {
  final String title;
  final String description;

  RecommendationModel({required this.title, required this.description});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
