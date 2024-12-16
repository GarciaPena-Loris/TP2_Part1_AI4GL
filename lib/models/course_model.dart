import 'dart:ffi';

class CourseModel {
  final String id;
  final String title;
  final String description;
  final Int duration;
  final List<String> videoUrls;
  final List<String> documentUrls;
  final List<Exercise> exercises; // Exercices associés à ce cours

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    this.videoUrls = const [],
    this.documentUrls = const [],
    this.exercises = const [],
  });

  // Méthode pour convertir un JSON en CourseModel
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      duration: json['duration'],
      videoUrls: List<String>.from(json['videoUrls']),
      documentUrls: List<String>.from(json['documentUrls']),
      exercises: json['exercises'] != null
          ? (json['exercises'] as List).map((i) => Exercise.fromJson(i)).toList()
          : [],
    );
  }

  // Méthode pour convertir un CourseModel en JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'videoUrls': videoUrls,
      'documentUrls': documentUrls,
      'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
    };
  }
}

// Modèle pour les exercices associés aux cours
class Exercise {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Exercise({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  // Méthode pour convertir un JSON en Exercise
  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      question: json['question'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
    );
  } 

  // Méthode pour convertir un Exercise en JSON
  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
    };
  }
}
