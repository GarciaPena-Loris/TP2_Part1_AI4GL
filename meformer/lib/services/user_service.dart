import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/activity_duration_model.dart';
import '../models/connection_history_model.dart';

class UserService {
  final String baseUrl = 'https://api.yourapp.com'; // Remplace par l'URL de ton API

  Future<List<ConnectionHistoryModel>> getConnectionHistory() async {
    final response = await http.get(Uri.parse('$baseUrl/connection-history'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ConnectionHistoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération de l\'historique de connexion.');
    }
  }

  Future<List<ActivityDurationModel>> getActivityDurations() async {
    final response = await http.get(Uri.parse('$baseUrl/activity-durations'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ActivityDurationModel.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des durées d\'activité.');
    }
  }
}
