import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart'; // table calendar library

// add code for a calendar widget here

class CalendarCard extends StatelessWidget {
  const CalendarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.5), // this spaces out the calendar
      child: Container(
        height: 475, // arbitrary size
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff161616),
        ),
        child: Container( // header container
          alignment: Alignment.topCenter,
          child: Expanded( // fills in width
            child: Column(
              children: [
                Container(
                  height: 50, // arbitrary height
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only( // the rounded corners of the container
                        topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                    color: Color(0xff2c704e), 
                  ),
                  child: const Center(
                    child: Text( // text header
                      'Calendar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                Calendar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(
          color: Colors.white
        ),
        outsideTextStyle: TextStyle(
          color: Colors.white
        ),
        weekendTextStyle: TextStyle(
          color: Colors.white
        ),
        todayTextStyle: TextStyle(
          color: Colors.black
        ),
      ),
      headerStyle: HeaderStyle(
        
      ),
      ),
    );
  }
}
