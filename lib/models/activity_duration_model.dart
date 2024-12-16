class ActivityDurationModel {
  final double duration; // Durée d'activité en heures, par exemple

  ActivityDurationModel({required this.duration});

  factory ActivityDurationModel.fromJson(Map<String, dynamic> json) {
    return ActivityDurationModel(
      duration: json['duration'].toDouble(),
    );
  }
}
