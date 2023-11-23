// lib/components/home_tabs.dart

import 'package:flutter/material.dart';
import 'package:cc206_tmbr_application/features/copy_and_paste_page.dart';
import 'package:cc206_tmbr_application/features/text_to_speech_page.dart';

class HomeTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Navigation'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Copy and Paste'),
              Tab(text: 'Text to Speech'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CopyAndPastePage(),
            TextToSpeechPage(),
          ],
        ),
      ),
    );
  }
}
