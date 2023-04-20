import 'package:flutter/material.dart';
import 'package:phone_app_test/Custom-Widgets/appbar.dart'; // appbar widget
import 'package:phone_app_test/Custom-Widgets/calendar.dart'; // calendar widget
import 'package:phone_app_test/Custom-Widgets/todo.dart'; // to-do list widget

class Homepage extends StatelessWidget {
// this is the study app class that extends a stateless widget which means this context is static

  const Homepage({super.key});

  @override
  /* 
  @override will allow us to overide the stateless context we applied to StudyApp through extension
  and still inherit the properties of the stateless widget. This is polymorphism if you're interested.
  */

  Widget build(BuildContext context) {
    /*
    this build method is called everytime you run the app instance and everytime you "hot reload"
    the application.
    */

    return Scaffold( 
      extendBody: true, // if this is false, then the scroll list view works as expected but it breaks the appbar
      body: Container( // this is the background color/gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff414345), Color(0xff232526)],
          )
        ),
        child: ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: ListView(
            padding: const EdgeInsets.all(25),
            children: <Widget>[
              const CalendarCard(), // don't believe either calendar or todo will be constants, since they will need to contain states and grow respectively
              const TodoList(),
              Container( // this fixes the problem of the extendbody property, just leave it please until we fix it
                height: 100,
              )
            ],
          ),
        )
      ),
      bottomNavigationBar: const CustomBottomBar()
    );
  }
}

// this is a scroll behavior that removes the scroll glow otherwise present in listview
// when a user scrolls to the top or bottom of a listview
class NoScrollGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

// When you're ready to run everything, press ctrl+f5 to

