import 'package:flutter/material.dart';

// add code for a calendar widget here

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.5), // this spaces out the calendar
      child: Container(
        height: 375, // arbitrary size
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff161616),
        ),
        child: Container( // header container
          alignment: Alignment.topCenter,
          child: Expanded( // fills in width
            child: Container(
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
          ),
        ),
      ),
    );
  }
}
