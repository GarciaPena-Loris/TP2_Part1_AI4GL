import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/course_model.dart';

class CourseService {
  final String baseUrl = 'https://your-api-url.com/api'; // Remplacer par l'URL de ton API

  // Récupérer la liste des cours
  Future<List<CourseModel>> getCourses() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/courses'));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((course) => CourseModel.fromJson(course)).toList();
      } else {
        // Gérer les erreurs
        print('Erreur lors de la récupération des cours: ${response.body}');
        return [];
      }
    } catch (e) {
      print('Erreur: $e');
      return [];
    }
  }

  // S'inscrire à un cours
  Future<bool> enrollInCourse(String userId, String courseId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/enroll'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'userId': userId,
          'courseId': courseId,
        }),
      );

      return response.statusCode == 200; // 200 OK
    } catch (e) {
      print('Erreur: $e');
      return false;
    }
  }

  // Récupérer les détails d'un cours
  Future<CourseModel?> getCourseDetails(String courseId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/courses/$courseId'));

      if (response.statusCode == 200) {
        return CourseModel.fromJson(json.decode(response.body));
      } else {
        // Gérer les erreurs
        print('Erreur lors de la récupération des détails du cours: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Erreur: $e');
      return null;
    }
  }

  Future<List<CourseModel>> getCompletedCourses(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$userId/completed_courses'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des cours complétés.');
    }
  }
}
