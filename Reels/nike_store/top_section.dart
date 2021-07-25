import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(
        horizontal: 35.0,
        vertical: 20.0,
      ),
      height: 120.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1F1F1F),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.menu,
            color: kWhiteColor.withOpacity(0.65),
          ),
          SvgPicture.asset(
            'assets/nike.svg',
            width: 50.0,
            color: kWhiteColor,
          ),
          Icon(
            Icons.search,
            color: kWhiteColor.withOpacity(0.65),
          ),
        ],
      ),
    );
  }
}
