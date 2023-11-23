import 'package:flutter/material.dart';
import 'package:cc206_tmbr_application/features/copy_and_paste_page.dart';
import 'package:cc206_tmbr_application/features/text_to_speech_page.dart';
import 'package:cc206_tmbr_application/components/home_drawer.dart';
import 'package:cc206_tmbr_application/components/home_tabs.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    theme: ThemeData(
      fontFamily: 'Architects_Daughter',
    ),
    routes: {
      '/copyAndPaste': (context) => CopyAndPastePage(),
      '/textToSpeech': (context) => TextToSpeechPage(),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
        ),
        drawer: HomeDrawer(),
        body: HomeTabs(),
      ),
    );
  }
}
