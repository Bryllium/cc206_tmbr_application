// text_to_speech.dart
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechButton extends StatelessWidget {
  final String scannedText;

  const TextToSpeechButton({required this.scannedText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _speakText(context, scannedText);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 50),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: const Text('Speech-to-text'),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred during text-to-speech'),
        ),
      );
    }
  }
}
