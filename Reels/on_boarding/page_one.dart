import 'package:flutter/material.dart';

import 'avatar.dart';
import 'constants.dart';

class PageOne extends StatelessWidget {
  // size of avatar
  final double value;

  const PageOne({
    Key key,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 270.0,
                ),
                Positioned(
                  left: 0.0,
                  top: 8.0,
                  child: Avatar(
                    image: 'girl_2.png',
                    size: 80.0 * value,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFFFB7D),
                        const Color(0xFF01C75C),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  left: 14.0,
                  bottom: 9.0,
                  child: Avatar(
                    image: 'boy_2.png',
                    size: 65.0 * value,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF21D4FD),
                        const Color(0xFFB721FF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  left: 110.0,
                  top: 94.0,
                  child: Avatar(
                    image: 'girl_1.png',
                    size: 116.0 * value,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF80D0C7),
                        const Color(0xFF0093E9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  right: 47.0,
                  top: 22.0,
                  child: Avatar(
                    image: 'boy_1.png',
                    size: 80.0 * value,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF003CDE),
                        const Color(0xFFFF006C),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  right: 10.0,
                  bottom: 0.0,
                  child: Avatar(
                    image: 'girl_3.png',
                    size: 90.0 * value,
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFBDA61),
                        const Color(0xFFFF5ACD),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 115.0,
          ),
          Text(
            'Be together, whenever',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            'A simple way to text, video chat and plan',
            style: TextStyle(
              color: kWhiteColor.withOpacity(0.8),
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'things all in one place.',
            style: TextStyle(
              color: kWhiteColor.withOpacity(0.8),
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
