import 'package:flutter/material.dart';
import 'package:studyapplication/timerpage.dart';
import 'package:studyapplication/timerpage2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent, // background (button) color
              onPrimary: Colors.black, // foreground (text) color
              shape: StadiumBorder()
      ),
    ),
  ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer Widget'),
        ),
        body: Center(
          child: StudyTimer(),
        ),
      ),
    );
  }
}
