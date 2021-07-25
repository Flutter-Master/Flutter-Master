import 'package:flutter/material.dart';

import 'avatar.dart';
import 'constants.dart';

class PageTwo extends StatelessWidget {
  // size of avatar
  final double value;

  const PageTwo({
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
            padding: EdgeInsets.only(right: 30.0),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 270.0,
                ),
                Positioned(
                  left: 19.0,
                  top: 41.0,
                  child: Avatar(
                    image: 'camera.svg',
                    size: 60.0 * value,
                    color: const Color(0xFF95D904),
                    isIcon: true,
                    iconSize: 19.0 * value,
                  ),
                ),
                Positioned(
                  left: 145.0,
                  top: 0.0,
                  child: Avatar(
                    image: 'alarm.svg',
                    size: 76.0 * value,
                    color: const Color(0xFF06A6F3),
                    isIcon: true,
                    iconSize: 28.0 * value,
                  ),
                ),
                Positioned(
                  left: 80.0,
                  bottom: 30.0,
                  child: Avatar(
                    image: 'heart.svg',
                    size: 110.0 * value,
                    color: const Color(0xFFD9043D),
                    isIcon: true,
                    iconSize: 46.0 * value,
                  ),
                ),
                Positioned(
                  top: 40.0,
                  right: 0.0,
                  child: Avatar(
                    image: 'comment.svg',
                    size: 76.0 * value,
                    color: const Color(0xFFF2C335),
                    isIcon: true,
                    iconSize: 30.0 * value,
                  ),
                ),
                Positioned(
                  right: 40.0,
                  bottom: 20.0,
                  child: Avatar(
                    image: 'user.svg',
                    size: 65.0 * value,
                    color: const Color(0xFF3E5ECF),
                    isIcon: true,
                    iconSize: 24.0 * value,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 115.0,
          ),
          Text(
            'Start a chat quickly',
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
            'Skip exchanging phone numbers, just send',
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
            'a message. It’s seamless across',
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
            'devices.',
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
