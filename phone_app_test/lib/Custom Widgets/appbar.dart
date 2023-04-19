import 'package:flutter/material.dart';
import '../Sylings/buttonStyles.dart';

/*
The following is a custom appbar widget made with composition, I've made comments
to try explain what's doing what
*/

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Appbar box
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
          height: 100,
          alignment: Alignment.bottomCenter, // this aligns the box and it's contents to the bottom of the page
          color: Colors.transparent,
          child: Stack(
            // stack is a widget used to render multiple widgets in sequence upon one another
            children: [
              // bounding-box render stack

              // this is the green box that creates the bottom bar box. Align moves the green box to
              // the bottom of the bounding box

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  // the actual green box
                  color: const Color(0xff2c704e),
                  height: 75,

                  // The stack drawn next is relative to the green box's dimensions, so it will be
                  // drawn within it. It also acts as the canvas for the icon buttons.

                  child: Stack(children: [
                    // button render stack

                    // Statistics button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Material(
                        // for some reason, icon buttons need material, least flutter has a stroke
                        color: Colors
                            .transparent, // this clears the materials color which creates a white sqaure
                        child: IconButton(
                          onPressed: () {
                            // add button functionality here
                          },
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.bar_chart),
                          splashColor: Colors.transparent, // this clears the inkwell fill on the buttons
                          highlightColor: Colors.transparent, // ibid
                        ),
                      ),
                    ),

                    // Settings button
                    Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            // add button functionality here
                          },
                          iconSize: 50,
                          color: Colors.white,
                          icon: const Icon(Icons.settings),
                          splashColor: Colors.transparent, // clears inkwell
                          highlightColor: Colors.transparent, // ibid
                        ),
                      ),
                    )
                  ] // children
                ),
              ),
            ),

              // Study button
            Align(
              alignment: Alignment.topCenter, // aligning button to center of the appbar bounding box
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality here
                },
                style: studyButton, // this is the study buttons properties, can be edited is buttonStyles.dart
                child: const Text(
                  'Study', // text
                  style: TextStyle(
                    fontSize: 25 // thought 25 was fine, play around with it
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
