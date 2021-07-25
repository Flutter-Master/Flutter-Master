import 'dart:ui';

import 'package:flutter/material.dart';

class BackdropWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // some widget
                Container(
                  height: 50.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                // other widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                // clip the filter to limit it
                // to the image
                ClipRect(
                  child: Stack(
                    children: <Widget>[
                      // image to which filter is
                      // to be applied
                      Image.asset(
                        'assets/image.jpg',
                        height: 300.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      // add the filter below the image
                      Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 8.0,
                            sigmaY: 8.0,
                          ),
                          child: Container(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // some other widgets
                Container(
                  height: 25.0,
                  width: 250.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
