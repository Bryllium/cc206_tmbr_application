// history.dart
import 'package:flutter/material.dart';
import 'copy_page.dart';
import 'text_to_speech_page.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView(
        children: <Widget>[
          HistoryItem(title: 'Text 1', subtitle: 'Rawr'),
          HistoryItem(title: 'Text 2', subtitle: 'Meow'),
          // Add more HistoryItem instances as needed
        ],
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const HistoryItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: const Icon(Icons.history),
        onTap: () {
          // Handle item tap if needed
        },
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CopyButton(
              scannedText: subtitle, // Pass the subtitle as the text to copy
            ),
            TextToSpeechButton(
              scannedText: subtitle, // Pass the subtitle as the text for speech
            ),
          ],
        ),
      ),
    );
  }
}
