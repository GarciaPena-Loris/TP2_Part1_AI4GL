import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthService {
  final String baseUrl = 'https://your-api-url.com/api'; // Remplacer par l'URL de ton API

  Future<UserModel?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(json.decode(response.body));
      } else {
        // Gérer les erreurs
        print('Erreur de connexion: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Erreur: $e');
      return null;
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      return response.statusCode == 201; // 201 Created
    } catch (e) {
      print('Erreur: $e');
      return false;
    }
  }
}
