import 'package:flutter/material.dart';

import '../../models/connection_history_model.dart';
import '../../services/user_service.dart';

class ConnectionHistoryScreen extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moments de Connexion'),
      ),
      body: FutureBuilder<List<ConnectionHistoryModel>>(
        future: userService.getConnectionHistory(), // Méthode fictive à créer dans le UserService
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun moment de connexion trouvé.'));
          }

          final connectionHistory = snapshot.data!;

          return ListView.builder(
            itemCount: connectionHistory.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Connexion: ${connectionHistory[index].timestamp}'),
              );
            },
          );
        },
      ),
    );
  }
}
