import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class Switcher extends StatefulWidget {
  // passing which graph to parent
  final ValueChanged<int> whichGraph;

  const Switcher({
    Key key,
    @required this.whichGraph,
  }) : super(key: key);

  @override
  _SwitcherState createState() => _SwitcherState();
}

class _SwitcherState extends State<Switcher> {
  // page controller for PageView
  PageController _controller;
  // keeping track of selected tab
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    // initialising the controller
    _controller = PageController();
  }

  @override
  void dispose() {
    // disposing the controller when
    // not in use
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: GestureDetector(
            onTap: () {
              // changing selected tab
              setState(() {
                _selectedTab = _selectedTab == 0 ? 1 : 0;
                _controller.animateToPage(
                  _selectedTab,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
                // passing the data to the parent
                widget.whichGraph(_selectedTab);
              });
            },
            child: Container(
              width: 250.0,
              height: 38.0,
              decoration: BoxDecoration(
                color: const Color(0xFFEBE3FF),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    alignment: _selectedTab == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    width: 250.0,
                    height: 38.0,
                    child: Container(
                      width: 125.0,
                      height: 38.0,
                      decoration: BoxDecoration(
                        color: kPurpleColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Expenses',
                        style: TextStyle(
                          color: _selectedTab == 0 ? kWhiteColor : kPurpleColor,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        'Income',
                        style: TextStyle(
                          color: _selectedTab == 1 ? kWhiteColor : kPurpleColor,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40.0,
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 200.0,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ExpenseCard(
                      title: 'Groceries',
                      amount: '\$4,231',
                      icon: 'grocery.svg',
                    ),
                    ExpenseCard(
                      title: 'Bills',
                      amount: '\$2,145',
                      icon: 'bills.svg',
                    ),
                    ExpenseCard(
                      title: 'Food',
                      amount: '\$870',
                      icon: 'food.svg',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ExpenseCard(
                      title: 'Salary',
                      amount: '\$6,389',
                      icon: 'salary.svg',
                    ),
                    ExpenseCard(
                      title: 'Freelance',
                      amount: '\$3,865',
                      icon: 'freelance.svg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExpenseCard extends StatelessWidget {
  // icon for the card
  final String icon;
  // title of the card
  final String title;
  // amount spend
  final String amount;

  const ExpenseCard({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.amount,
  }) : super(key: key);

  // get appropriate color for icon
  Color _getIconColor() {
    switch (title) {
      case 'Groceries':
        return kOrangeColor;
        break;
      case 'Bills':
        return kPurpleColor;
        break;
      case 'Food':
        return kBlueColor;
        break;
      case 'Salary':
        return kBlueColor;
        break;
      case 'Freelance':
        return kPurpleColor;
        break;
      default:
        return kWhiteColor;
    }
  }

  // get appropriate background color
  // for icon
  Color _getIconBackgroundColor() {
    switch (title) {
      case 'Groceries':
        return const Color(0xFFFFF7E8);
        break;
      case 'Bills':
        return const Color(0xFFF6F2FF);
        break;
      case 'Food':
        return const Color(0xFFEFFCFF);
        break;
      case 'Salary':
        return const Color(0xFFEFFCFF);
        break;
      case 'Freelance':
        return const Color(0xFFF6F2FF);
        break;
      default:
        return kWhiteColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.0,
        top: 15.0,
        right: 15.0,
        bottom: 18.0,
      ),
      height: 125.0,
      width: 90.0,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: const Offset(0.0, 1.0),
            color: kBlackColor.withOpacity(0.06),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 28.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: _getIconBackgroundColor(),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: SvgPicture.asset(
              'assets/$icon',
              height: 15.0,
              color: _getIconColor(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: kPrimaryTextColor.withOpacity(0.5),
                  fontSize: 11.0,
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                amount,
                style: TextStyle(
                  color: kPrimaryTextColor.withOpacity(0.9),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
