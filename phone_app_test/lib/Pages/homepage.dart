import 'package:flutter/material.dart';
import 'package:phone_app_test/Custom Widgets/appbar.dart'; // appbar widget
import 'package:phone_app_test/Custom Widgets/calendar.dart'; // calendar widget
import 'package:phone_app_test/Custom Widgets/todo.dart'; // to-do list widget

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

    /*
    a material app is a preset widget for building apps, not needed for everything
    but a good place to start building apps. 'home:' is a property of this widget
    that you can assign other widgets to represent.
    */

    return Scaffold( 
      extendBody: true, // if this is false, then the scroll list view works as expected but it breaks the appbar
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff414345), Color(0xff232526)],
          )
        ),
        child: ListView(
          padding: const EdgeInsets.all(25),
          children: <Widget>[

            // put calendar widget here
            Padding(
              padding: const EdgeInsets.only(top: 12.5, bottom: 12.5),
              child: Container(
                height: 375,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 90, 90, 90),
                ),
              ),
            ),

            // put to-do list widget here
            Padding(
              padding: const EdgeInsets.only(top: 12.5, bottom: 12.5),
              child: Container(
                height: 375,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 90, 90, 90),
                ),
              ),
            ),
            Container( // this fixes the problem of the extendbody property, just leave it please until we fix it
              height: 100,
            )
          ],
        )
      ),
      bottomNavigationBar: const CustomBottomBar()
    );
  }
}

// When you're ready to run everything, press ctrl+f5 to