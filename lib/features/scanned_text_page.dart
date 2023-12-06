// scanned_text.dart
import 'package:cc206_tmbr_application/copy_page.dart';
import 'package:cc206_tmbr_application/text_to_speech_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ScannedTextPage extends StatelessWidget {
  final String scannedText;

  const ScannedTextPage({Key? key, required this.scannedText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Text'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display scanned text
              Text(
                scannedText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              // Copy button
              CopyButton(scannedText: scannedText),
              const SizedBox(height: 20),
              // Speech-to-text button
              TextToSpeechButton(scannedText: scannedText),
            ],
          ),
        ),
      ),
    );
  }
}
