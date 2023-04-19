import 'package:flutter/material.dart';
import 'package:phone_app_test/Custom-Widgets/taskTile.dart'; // task tile to be used later

// will need reformating

// add code for a to-do list widget here

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.5, bottom: 12.5),
      child: Container(
        height: 375, // arbitrary size for the box, we want the calendar to fit in here
        decoration: BoxDecoration( // this gives the rounded corners and box color
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xff161616),
        ),
        child: Container( // the text banner
          alignment: Alignment.topCenter,
          child: Expanded( // this will maximize any size that's not specified
            child: Container(
              height: 50, // height of the text banner
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only( // this is the radius of the box borders
                  topLeft: Radius.circular(5), 
                  topRight: Radius.circular(5)
                  ),
                color: Color(0xff2c704e),
              ),
              child: const Center(
                child: Text( // text header
                  'To-Do',
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