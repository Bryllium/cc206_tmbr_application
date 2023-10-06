import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text to Speech App',
      home: TexttoSpeechPage(),
    );
  }
}

class TexttoSpeechPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech Page'),
      ),
      body: Center(
        child: Text(
          'Your Text to Speech Content Goes Here',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
