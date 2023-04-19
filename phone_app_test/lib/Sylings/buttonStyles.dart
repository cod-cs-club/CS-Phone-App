import 'package:flutter/material.dart';

// if you have buttons you wish to style, it's more maintainable if you have them stored in a seperate file
// this is that file

final ButtonStyle studyButton = ElevatedButton.styleFrom( // button style for the studdy button
    minimumSize: const Size(125, 50),
    elevation: 0,
    backgroundColor: const Color(0xff43a446),
    shape: const StadiumBorder());