class ConnectionHistoryModel {
  final String timestamp; // Exemple de champ, adapte selon ton besoin

  ConnectionHistoryModel({required this.timestamp});

  factory ConnectionHistoryModel.fromJson(Map<String, dynamic> json) {
    return ConnectionHistoryModel(
      timestamp: json['timestamp'],
    );
  }
}
