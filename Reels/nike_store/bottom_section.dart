import 'package:flutter/material.dart';

import 'constants.dart';
import 'for_you_card.dart';

class BottomSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 230.0,
        width: double.infinity,
        color: kBlackColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Text(
                'Picked for You',
                style: const TextStyle(
                  color: kWhiteColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ItemList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList>
    with SingleTickerProviderStateMixin {
  // animation controller
  AnimationController _controller;
  // slide animation of list view
  Animation<Offset> _scrollAnimation;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // initialising the animation
    _scrollAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    // playing animation
    _playAnimation();
  }

  void _playAnimation() async {
    // some delay
    await Future.delayed(const Duration(milliseconds: 400));
    // playing animation
    _controller.forward();
  }

  @override
  void dispose() {
    // disposing controller when
    // not in use
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _scrollAnimation,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 35.0),
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          return ForYouCard(
            index: index,
            name: shoeName[index],
            price: shoePrice[index],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 20.0,
          );
        },
      ),
    );
  }
}
