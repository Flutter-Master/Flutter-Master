import 'package:flutter/material.dart';

import 'constants.dart';

class ForYouCard extends StatelessWidget {
  // card index
  final int index;
  // shoe name
  final String name;
  // shoe price
  final String price;

  const ForYouCard({
    Key key,
    @required this.index,
    @required this.name,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 20.0),
            height: 130.0,
            width: 225.0,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Image.asset(
              'assets/shoe_${index + 1}.jpg',
              width: 115.0,
            ),
          ),
          Positioned(
            top: 15.0,
            right: 15.0,
            child: Icon(
              index.isEven ? Icons.favorite : Icons.favorite_border,
              size: 16.0,
              color: index.isEven ? kOrangeColor : kGreyColor,
            ),
          ),
          Positioned(
            left: 15.0,
            right: 15.0,
            bottom: 12.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    color: kPrimaryTextColor,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: kPrimaryTextColor.withOpacity(0.6),
                    fontSize: 10.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
