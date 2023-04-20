import 'package:flutter/material.dart';
import 'dart:async';
import 'package:studyapplication/statisticspage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// Initiating the class stating that is a dynamic widget = Stateful
class StudyTimer extends StatefulWidget {
  @override
  _StudyTimerState createState() => _StudyTimerState();
}

class _StudyTimerState extends State<StudyTimer> {
  late Timer _timer; // Creating the variable timer from flutter library
  int _elapsedTimeInSeconds = 0; // Setting a defualt initial value
  bool _isPaused = false; // Creating a boolean variable to hold the value for button PAUSE

  // Start button to start the timer
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTimeInSeconds++; // Increase the saved elapsed time in seconds
      });
    });
  }

  // Pause button to start the timer
  void _pauseTimer() {
    _timer.cancel();
    setState(() {
      _isPaused = true;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Timer Paused'),
          content: Text('Press resume to continue the timer.'),
          actions: [
            TextButton(
              child: Text('Resume'),
              onPressed: () {
                Navigator.of(context).pop();
                _isPaused = false;
                _startTimer();
              },
            ),
          ],
        );
      },
    );
  }

  Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
  }

  Future<File> get _localFile async {
  final path = await _localPath;
  return File('C:/Users/Andrea/Documents/PROJECTS/COD_CS_CLUB/PhoneApp-StudyApp/CS-Phone-App/statistics.txt');
  }

  Future<File> writeCounter(List<List<int>> _elapsedTimes) async {
    final file = await _localFile;
    // Write the file
  return file.writeAsString('$_elapsedTimes');
  }

  // Creating the stop button
  List<List<int>> _elapsedTimes = []; // create a list to hold elapsed times
  void _stopTimer() {
    _timer.cancel();
    int minutes = (_elapsedTimeInSeconds / 60).floor();
    int seconds = _elapsedTimeInSeconds % 60;
    String elapsedTime = '$minutes min $seconds sec';
    // Use the elapsedTime variable to store the elapsed time for statistics
    // add elapsed time to list
    _elapsedTimes.add([minutes, seconds]);

    setState(() {
      _elapsedTimeInSeconds = 0;
      _isPaused = false;
    });
  }

  // Button to show the statistics widget
  void _showStatistics() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudyTimerStatistics(elapsedTimeList: _elapsedTimes)),
    );
  }

  // Creating the container for the timer
  @override
  Widget build(BuildContext context) {
    // Returning a singular column, with statistics button (temporary for testing purposes), timer display, and the three button(start, pause, and stop)
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Statistics button
        ElevatedButton(
          onPressed: _showStatistics,
          child: Text('Show Statistics'),
        ),
        SizedBox(height: 16.0),
        // Timer displayed 
        Text(
          '${(_elapsedTimeInSeconds / 60).floor().toString().padLeft(2, '0')}:${(_elapsedTimeInSeconds % 60).toString().padLeft(2, '0')}',
          style: TextStyle(fontSize: 64.0),
        ),
        SizedBox(height: 16.0),
        // Displaying in a single row the three buttons commented below
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Start button
            ElevatedButton(
              onPressed: _isPaused ? null : _startTimer,
              child: Text('Start'),
            ),
            SizedBox(width: 16.0),
            // Pause button
            ElevatedButton(
              onPressed: _isPaused ? null : _pauseTimer,
              child: Text('Pause'),
            ),
            SizedBox(width: 16.0),
            // Stop button
            ElevatedButton(
              onPressed: _stopTimer,
              child: Text('Stop'),
            ),
          ],
        ),
      ],
    );
  }
}
