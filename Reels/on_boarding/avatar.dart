import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'constants.dart';

/// Circular Avatar
class Avatar extends StatelessWidget {
  // name of image
  final String image;
  // size of image + color border
  final double size;
  // gradient for border
  final LinearGradient gradient;
  // color of border
  final Color color;
  // size of icon
  final double iconSize;
  // is icon or not
  final bool isIcon;

  const Avatar({
    Key key,
    @required this.image,
    @required this.size,
    this.gradient,
    this.color,
    this.iconSize,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size,
      width: size,
      decoration:
          // whether to show color border or
          // gradient border
          gradient != null
              ? BoxDecoration(
                  gradient: gradient,
                  shape: BoxShape.circle,
                )
              : BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
      // gap between border and
      // image / icon
      child: Container(
        alignment: Alignment.center,
        height: size - 4.0,
        width: size - 4.0,
        decoration: BoxDecoration(
          color: kDarkBackgroundColor,
          shape: BoxShape.circle,
        ),
        child:
            // whether to show icon or image
            // inside circle
            isIcon
                ? Container(
                    alignment: Alignment.center,
                    height: size - 8.0,
                    width: size - 8.0,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/$image',
                      width: iconSize,
                      height: iconSize,
                      color: color,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'assets/$image',
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                      width: size - 8.0,
                      height: size - 8.0,
                    ),
                  ),
      ),
    );
  }
}
