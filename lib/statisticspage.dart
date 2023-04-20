import 'package:flutter/material.dart';
import 'package:studyapplication/timerpage.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:studyapplication/timerpage.dart';


extension DateTimeExtension on DateTime {
  int get weekOfYear {
    final firstDayOfYear = DateTime(year, 1, 1);
    final daysSinceFirstDayOfYear = difference(firstDayOfYear).inDays;
    return (daysSinceFirstDayOfYear / 7).ceil();
  }
}

class StudyTimerStatistics extends StatefulWidget {
  final List<List<int>> elapsedTimeList;

  const StudyTimerStatistics({Key? key, required this.elapsedTimeList})
      : super(key: key);

  @override
  _StudyTimerStatisticsState createState() => _StudyTimerStatisticsState();
}

class _StudyTimerStatisticsState extends State<StudyTimerStatistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Timer Statistics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daily Statistics',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '${getElapsedTimeForToday(widget.elapsedTimeList)} min ${getElapsedSecondsForToday(widget.elapsedTimeList)} sec',
              style: TextStyle(fontSize: 36.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Weekly Statistics',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '${getElapsedTimeForThisWeek(widget.elapsedTimeList)} min ${getElapsedTimeForThisWeek(widget.elapsedTimeList)} sec',
              style: TextStyle(fontSize: 36.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Yearly Statistics',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              '${getElapsedTimeForThisYear(widget.elapsedTimeList)} min ${getElapsedTimeForThisYear(widget.elapsedTimeList)} sec',
              style: TextStyle(fontSize: 36.0),
            ),
          ],
        ),
      ),
    );
  }

List<int> getElapsedTimeForToday(List<List<int>> elapsedTimeList) {
    DateTime now = DateTime.now();
    int todayElapsed = 0;
    int todayElapsedSeconds = 0;
    for (int i = 0; i < elapsedTimeList.length; i++) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(elapsedTimeList[i][0] * 1000);
      if (time.day == now.day && time.month == now.month && time.year == now.year) {
        todayElapsed += time.hour * 60 + time.minute;
        todayElapsedSeconds += time.second;
      }
    }
    return [todayElapsed, todayElapsedSeconds];
  }

  List<int> getElapsedSecondsForToday(List<List<int>> elapsedTimeList) {
    DateTime now = DateTime.now();
    int todayElapsed = 0;
    int todayElapsedSeconds = 0;
    for (int i = 0; i < elapsedTimeList.length; i++) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(elapsedTimeList[i][1] * 1000);
      if (time.day == now.day && time.month == now.month && time.year == now.year) {
        todayElapsed += time.hour * 60 + time.minute;
        todayElapsedSeconds += time.second;
      }
    }
    return [todayElapsed, todayElapsedSeconds];
  }

  int getElapsedTimeForThisWeek(List<List<int>> elapsedTimeList) {
    DateTime now = DateTime.now();
    int weekElapsed = 0;
    for (int i = 0; i < elapsedTimeList.length; i++) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(elapsedTimeList[i][0] * 1000);
      if (time.weekOfYear == now.weekOfYear && time.year == now.year) {
        weekElapsed += time.hour * 60 + time.minute;
      }
    }
    return weekElapsed;
  }
  

  int getElapsedTimeForThisYear(List<List<int>> elapsedTimeList) {
    DateTime now = DateTime.now();
    int yearElapsed = 0;
    for (int i = 0; i < elapsedTimeList.length; i++) {
      DateTime time = DateTime.fromMillisecondsSinceEpoch(elapsedTimeList[i][0] * 1000);
      if (time.year == now.year) {
        yearElapsed += time.hour * 60 + time.minute;
      }
    }
    return yearElapsed;
  }
}
