import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'constants.dart';

class MiddleSection extends StatefulWidget {
  @override
  _MiddleSectionState createState() => _MiddleSectionState();
}

class _MiddleSectionState extends State<MiddleSection> {
  // page controller
  PageController _pageController;

  // index of current page
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: _currentPage,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    // disposing controller when
    // not in use
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: 7,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page - index;
              value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
            } else {
              value = index == 0 ? value : value * 0.4;
            }
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 15.0,
              ),
              alignment: Alignment.center,
              // for fading in and out
              child: Opacity(
                opacity: value,
                // for rotating card
                child: Transform.rotate(
                  angle: -(math.pi / 6 * (1 - value)),
                  child: MiddleShoeCard(
                    multiplyingFactor: value,
                    number: index,
                    name: shoeName[index],
                    price: shoePrice[index],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class MiddleShoeCard extends StatelessWidget {
  // multiplying factor
  final double multiplyingFactor;
  // card index
  final int number;
  // shoe name
  final String name;
  // shoe price
  final String price;

  const MiddleShoeCard({
    Key key,
    @required this.multiplyingFactor,
    @required this.number,
    @required this.name,
    @required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.0 * multiplyingFactor,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Image.asset(
                    'assets/shoe_${number + 1}.jpg',
                    width: 250.0 * multiplyingFactor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        color: kPrimaryTextColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        color: kPrimaryTextColor.withOpacity(0.8),
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 25.0,
            right: 25.0,
            child: Icon(
              number.isOdd ? Icons.favorite : Icons.favorite_border,
              size: 22.0,
              color: number.isOdd ? kOrangeColor : kGreyColor,
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              alignment: Alignment.center,
              width: 90.0 * multiplyingFactor,
              height: 40.0 * multiplyingFactor,
              decoration: BoxDecoration(
                color: kOrangeColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
              child: Text(
                'ADD',
                style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 12.0 * multiplyingFactor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
