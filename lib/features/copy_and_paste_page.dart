import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CopyAndPastePage(),
  ));
}

class CopyAndPastePage extends StatefulWidget {
  const CopyAndPastePage({Key? key}) : super(key: key);

  @override
  _CopyAndPastePageState createState() => _CopyAndPastePageState();
}

class _CopyAndPastePageState extends State<CopyAndPastePage> {
  final TextEditingController _textController = TextEditingController();
  String pastedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Copy and Paste Page'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Put a text:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Text to Copy',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  pastedText = _textController.text;
                });
              },
              child: Text('Copy'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Pasted Text:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.teal),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                pastedText,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
