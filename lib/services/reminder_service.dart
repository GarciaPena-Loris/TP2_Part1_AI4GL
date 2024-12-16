import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/reminder_model.dart'; // Ajuste le chemin

class ReminderService {
  final String baseUrl = 'https://api.yourapp.com'; // Remplace par l'URL de ton API

  Future<void> setReminder(ReminderModel reminder) async {
    final response = await http.post(
      Uri.parse('$baseUrl/reminders'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(reminder.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Erreur lors de la définition du rappel.');
    }
  }

  Future<List<ReminderModel>> getReminders() async {
    final response = await http.get(Uri.parse('$baseUrl/reminders'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => ReminderModel.fromJson(json)).toList();
    } else {
      throw Exception('Erreur lors de la récupération des rappels.');
    }
  }
}
