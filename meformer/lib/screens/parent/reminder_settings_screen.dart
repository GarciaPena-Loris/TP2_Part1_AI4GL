import 'package:flutter/material.dart';

import '../../models/reminder_model.dart';
import '../../services/reminder_service.dart';

class ReminderSettingsScreen extends StatefulWidget {
  @override
  _ReminderSettingsScreenState createState() => _ReminderSettingsScreenState();
}

class _ReminderSettingsScreenState extends State<ReminderSettingsScreen> {
  final ReminderService reminderService = ReminderService();
  final TextEditingController titleController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Définir un Rappel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titre du Rappel'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Heure: ${selectedTime.format(context)}"),
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? time = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (time != null) {
                      setState(() {
                        selectedTime = time;
                      });
                    }
                  },
                  child: Text('Sélectionner l\'heure'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final reminder = ReminderModel(
                  title: titleController.text,
                  time: DateTime.now().add(Duration(hours: selectedTime.hour, minutes: selectedTime.minute)),
                );
                reminderService.setReminder(reminder);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Rappel défini pour ${selectedTime.format(context)}')),
                );
              },
              child: Text('Définir le Rappel'),
            ),
          ],
        ),
      ),
    );
  }
}
