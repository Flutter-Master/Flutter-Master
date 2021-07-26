import 'package:flutter/material.dart';

import 'tabs/explore_tab.dart';
import 'tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //Animation Controller
  late final AnimationController _animationController;
  //Animation for 1st list
  late final Animation<Offset> _animation1;
  //Animation for 2nd list
  late final Animation<Offset> _animation2;
  //Animation for 3rd list
  late final Animation<Offset> _animation3;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _animation1 =
        Tween<Offset>(begin: const Offset(0.5, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.8, curve: Curves.fastOutSlowIn),
      ),
    );
    _animation2 =
        Tween<Offset>(begin: const Offset(0.5, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.9, curve: Curves.fastOutSlowIn),
      ),
    );

    _animation3 =
        Tween<Offset>(begin: const Offset(0.5, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabs = [
      HomeTab(
        animation1: _animation1,
        animation2: _animation2,
        animation3: _animation3,
      ),
      const ExploreTab()
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: _tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: Colors.black,
        iconSize: 22,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Explore",
          ),
        ],
      ),
    );
  }
}
