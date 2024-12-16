import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/recommendation_model.dart'; // Ajuste le chemin

class RecommendationService {
  final String baseUrl = 'https://api.yourapp.com'; // Remplace par l'URL de ton API

  Future<List<RecommendationModel>> getRecommendations() async {
    final response = await http.get(Uri.parse('$baseUrl/recommendations'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => RecommendationModel.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des recommandations.');
    }
  }
}
