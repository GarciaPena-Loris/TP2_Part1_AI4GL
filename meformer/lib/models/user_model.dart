class UserModel {
  final String id;
  final String name;
  final String email;
  final String role;  // 'parent' ou 'student'
  final List<Student> students; // Liste d'élèves pour les parents, vide pour les élèves

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.students = const [],
  });

  // Méthode pour convertir un JSON en UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      students: json['students'] != null
          ? (json['students'] as List).map((i) => Student.fromJson(i)).toList()
          : [],
    );
  }

  // Méthode pour convertir un UserModel en JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'students': students.map((student) => student.toJson()).toList(),
    };
  }
}

// Modèle pour représenter un élève dans le cas des parents
class Student {
  final String name;
  final String grade;  // Niveau scolaire de l'élève

  Student({
    required this.name,
    required this.grade,
  });

  // Méthode pour convertir un JSON en Student
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      grade: json['grade'],
    );
  }

  // Méthode pour convertir un Student en JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'grade': grade,
    };
  }
}
