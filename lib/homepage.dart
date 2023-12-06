import 'package:final_project/historypage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  // Handle camera button press
                  // Add your camera logic here
                  // Go to ScannedTextPage with the scanned text
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScannedTextPage(
                        // Pass scanned text here
                        scannedText: "App Dev",
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: const EdgeInsets.all(20),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Scan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

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
              ElevatedButton(
                onPressed: () {
                  // Copy scanned text to clipboard
                  Clipboard.setData(ClipboardData(text: scannedText));
                  // Show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Text copied to clipboard')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Copy'),
              ),
              const SizedBox(height: 20),
              // Speech-to-text button
              ElevatedButton(
                onPressed: () {
                  // Start text-to-speech
                  _speakText(context, scannedText);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Speech-to-text'),
              ),
            ],
          ),
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
