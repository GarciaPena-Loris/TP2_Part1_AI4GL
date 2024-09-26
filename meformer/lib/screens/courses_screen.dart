import 'package:flutter/material.dart';


import '../models/course_model.dart';
import '../services/course_service.dart';
import '../widgets/course_item.dart'; // Ajuste le chemin

class CoursesScreen extends StatelessWidget {
  final String userId; // Ajoute une variable pour stocker userId
  final CourseService courseService = CourseService();

  CoursesScreen({required this.userId}); // Modifie le constructeur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cours et Exercices Réalisés'),
      ),
      body: FutureBuilder<List<CourseModel>>(
        future: courseService.getCompletedCourses(userId), // Méthode fictive à créer dans le CourseService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun cours ou exercice trouvé.'));
          }

          final courses = snapshot.data!;

          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              return CourseItem(
                course: courses[index],
                onTap: () {
                  // Navigation vers les détails du cours si nécessaire
                },
              );
            },
          );
        },
      ),
    );
  }
}
