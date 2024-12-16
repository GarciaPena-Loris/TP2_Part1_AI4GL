import 'package:flutter/material.dart';

import '../../models/recommendation_model.dart';
import '../../services/recommendation_service.dart';

class RecommendationsScreen extends StatefulWidget {
  @override
  _RecommendationsScreenState createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  final RecommendationService recommendationService = RecommendationService();
  late Future<List<RecommendationModel>> futureRecommendations;

  @override
  void initState() {
    super.initState();
    futureRecommendations = recommendationService.getRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommandations'),
      ),
      body: FutureBuilder<List<RecommendationModel>>(
        future: futureRecommendations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucune recommandation disponible.'));
          }

          final recommendations = snapshot.data!;

          return ListView.builder(
            itemCount: recommendations.length,
            itemBuilder: (context, index) {
              final recommendation = recommendations[index];
              return ListTile(
                title: Text(recommendation.title),
                subtitle: Text(recommendation.description),
              );
            },
          );
        },
      ),
    );
  }
}
