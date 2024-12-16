import 'package:flutter/material.dart';

import '../models/activity_duration_model.dart';
import '../services/user_service.dart'; // Ajuste le chemin

class ActivityDurationScreen extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Durées d\'Activité'),
      ),
      body: FutureBuilder<List<ActivityDurationModel>>(
        future: userService.getActivityDurations(), // Méthode fictive à créer dans le UserService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune activité trouvée.'));
          }

          final activityDurations = snapshot.data!;

          return ListView.builder(
            itemCount: activityDurations.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Activité: ${activityDurations[index].duration} heures'),
              );
            },
          );
        },
      ),
    );
  }
}
