import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tableau de Bord Élève'),
      ),
      body: Center(
        child: Text('Bienvenue sur le tableau de bord des élèves!'),
      ),
    );
  }
}
