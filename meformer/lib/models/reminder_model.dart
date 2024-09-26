class ReminderModel {
  final String title;
  final DateTime time; // Heure à laquelle le rappel doit se déclencher

  ReminderModel({required this.title, required this.time});

  factory ReminderModel.fromJson(Map<String, dynamic> json) {
    return ReminderModel(
      title: json['title'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'time': time.toIso8601String(),
    };
  }
}
