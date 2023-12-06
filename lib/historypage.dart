import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(context, 'Text 1', 'Rawr'),
          _buildListItem(context, 'Text 2', 'Meow'),
          // Add more _buildListItem calls as needed
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, String title, String subtitle) {
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
            IconButton(
              icon: const Icon(Icons.content_copy),
              onPressed: () {
                // Copy text to clipboard
                Clipboard.setData(ClipboardData(text: subtitle));
                // Show snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Text copied to clipboard')),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () {
                // Start text-to-speech
                _speakText(context, subtitle);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _speakText(BuildContext context, String text) async {
    final FlutterTts flutterTts = FlutterTts();

    try {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(1.0);
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.speak(text);
    } catch (e) {
      // Handle any errors that occur during text-to-speech
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred during text-to-speech'),
        ),
      );
    }
  }
}
