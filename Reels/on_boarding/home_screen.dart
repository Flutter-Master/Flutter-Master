/*
This UI is created for the screen size of iPhone X
(375 x 812 px).

Note that it is not made responsive. If you are seeing it
on any other screen, please change the values respectively.

Don't forget to add dependency for lottie & flutter_svg:

dependencies:
  lottie: ^0.6.0
  flutter_svg: ^0.17.0

All the required assets are available in the assets
folder.

Created by Flutter Master.
https://www.instagram.com/flutter.master/

 */

import 'package:flutter/material.dart';

import 'constants.dart';
import 'page_one.dart';
import 'page_three.dart';
import 'page_two.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // page controller
  PageController _pageController;

  // keeping track of current page
  int _currentPage = 0;

  // isDarkTheme or not
  bool _iseDarkTheme = true;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: true,
    )..addListener(() {
        setState(() {
          _currentPage = _pageController.page.round();
        });
      });
  }

  @override
  void dispose() {
    // disposing the controller when
    // not in use
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _iseDarkTheme ? kDarkBackgroundColor : kLightBackgroundColor,
      body: SafeArea(
        top: false,
        left: false,
        right: false,
        bottom: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                itemBuilder: (context, index) {
                  // To give that increasing effect
                  // to the avatars
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      // multiplying factor for size
                      double value = 1.0;
                      // calculating the value
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page - index;
                        value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
                      } else {
                        value = index == 0 ? value : value * 0.8;
                      }
                      // return first page if index is 0
                      if (index == 0) {
                        return PageOne(
                          value: value,
                        );
                      }
                      // return second page if index is 1
                      else if (index == 1) {
                        return PageTwo(
                          value: value,
                        );
                      }
                      // return third page otherwise
                      return PageThree(
                        isDarkTheme: (newValue) {
                          setState(() {
                            _iseDarkTheme = newValue;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
            // page indicator at the bottom
            // of the screen
            _PageIndicator(
              currentPage: _currentPage,
              isDarkTheme: _iseDarkTheme,
            ),
          ],
        ),
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  // index of current page
  final int currentPage;
  // is dark theme
  final bool isDarkTheme;

  const _PageIndicator({
    Key key,
    @required this.currentPage,
    @required this.isDarkTheme,
  }) : super(key: key);

  // get color for dot
  Color _getDotColor(int index) {
    if (!isDarkTheme) {
      return currentPage == index
          ? kDarkTextColor.withOpacity(0.9)
          : kDarkTextColor.withOpacity(0.3);
    }

    return currentPage == index
        ? kWhiteColor.withOpacity(0.9)
        : kWhiteColor.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      alignment: Alignment.center,
      height: 6.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              color: _getDotColor(0),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              color: _getDotColor(1),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              color: _getDotColor(2),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
