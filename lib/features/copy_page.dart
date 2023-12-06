// copy.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatelessWidget {
  final String scannedText;

  const CopyButton({required this.scannedText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Clipboard.setData(ClipboardData(text: scannedText));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Text copied to clipboard')),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 50),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: const Text('Copy'),
    );
  }
}
