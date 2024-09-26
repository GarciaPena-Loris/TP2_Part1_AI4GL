import 'package:flutter/material.dart';
import 'package:meformer/screens/parent/connection_history_screen.dart';
import 'package:meformer/screens/parent/recommendations_screen.dart';
import 'package:meformer/screens/parent/reminder_settings_screen.dart';
import 'package:meformer/widgets/custom_button.dart';

import 'activity_duration_screen.dart';
import 'courses_screen.dart';

class DashboardParentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard Parent'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Visualiser les moments de connexion',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConnectionHistoryScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Visualiser les cours et exercices réalisés',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoursesScreen(userId: 'userIdHere')),
                );
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Visualiser les durées d’activité',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivityDurationScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Visualiser les recommandations',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecommendationsScreen()),
                );
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: 'Définir des moments de rappel',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReminderSettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
