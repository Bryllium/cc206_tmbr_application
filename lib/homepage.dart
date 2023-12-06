// homepage.dart
import 'package:flutter/material.dart';
import 'camera_button.dart'; // Import the new file
import 'scanned_text_page.dart'; // Import your scanned text page
import 'history_page.dart'; // Import the history page

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
          children: <Widget>[
            // ... (existing code)

            // Camera button
            CameraButton(
              onPressed: () {
                // Handle camera button press
                // Add your camera logic here
                // Go to ScannedTextPage with the scanned text
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScannedTextPage(
                      // Pass scanned text here
                      scannedText: "Application Development",
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Text below the camera button
            const Text(
              'Scan',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            // ... (any other widgets you want to include)
          ],
        ),
      ),
    );
  }
}
