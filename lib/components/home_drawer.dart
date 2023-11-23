// lib/components/home_drawer.dart

import 'package:flutter/material.dart';
import 'package:cc206_tmbr_application/features/copy_and_paste_page.dart';
import 'package:cc206_tmbr_application/features/text_to_speech_page.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Text(
              'App Drawer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Copy and Paste Page'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/copyAndPaste');
            },
          ),
          ListTile(
            title: Text('Text to Speech Page'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushNamed(context, '/textToSpeech');
            },
          ),
        ],
      ),
    );
  }
}
