import 'package:flutter/material.dart';
import 'package:phone_app_test/Pages/homepage.dart';

// leave this alone for now, unless you absolutely need to change it, this will 
// run the main homepage dart file. If you wish to change this, please take a look
// at the homepage dart file. If you wish to view your own page, import it like 
// homepage is imported above and replace Homepage() with the name of your class.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Homepage()
      )
    );
  /* 
  flutter has a core method to running an app with the runApp(<insert app class>) function
  and like C++ initializes at the main function 
  */
}
