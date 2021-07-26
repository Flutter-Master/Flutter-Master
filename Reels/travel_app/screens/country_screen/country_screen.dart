import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../model/country.dart';
import '../../model/trip.dart';
import '../home_screen/widgets/normal_card.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({required this.country, Key? key}) : super(key: key);
  final Country country;

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen>
    with TickerProviderStateMixin {
  //Main Animation Controller
  late final AnimationController _animationController;
  //Background image animation controller
  late final AnimationController _backgroundController;

//Black layer animation Fadein
  late final Animation<double> _layerAnimation;
  //Title animation Fadein
  late final Animation<double> _titleAnimation;
  //Description animation Fadein
  late final Animation<double> _descriptionAnimation;
  //list animation Slide in
  late final Animation<Offset> _listAnimation;

  @override
  void initState() {
    super.initState();
    //Main controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

//background image controller
    _backgroundController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600000),
      lowerBound: 1,
      upperBound: 60,
      animationBehavior: AnimationBehavior.preserve,
    );

    _layerAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );
    _titleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, 0.4, curve: Curves.easeInOut),
      ),
    );

    _descriptionAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 0.8, curve: Curves.easeInOut),
      ),
    );
    _listAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1, curve: Curves.fastOutSlowIn),
      ),
    );

    _animationController.forward();
    _backgroundController.forward();

    _backgroundController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _backgroundController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _backgroundController.dispose();
    _backgroundController.removeStatusListener((status) {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.country.name,
            child: ScaleTransition(
              scale: _backgroundController,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.country.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: _layerAnimation,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.7),
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Center(
                        child: FadeTransition(
                          opacity: _titleAnimation,
                          child: Text(
                            widget.country.name,
                            textAlign: TextAlign.center,
                            style: kLargeTitle.copyWith(
                              fontSize: 30,
                              letterSpacing: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Center(
                          child: FadeTransition(
                            opacity: _descriptionAnimation,
                            child: Text(
                              widget.country.description,
                              textAlign: TextAlign.center,
                              style: kQuoteStyle.copyWith(
                                fontSize: 14,
                                letterSpacing: 0,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 175,
                        child: ListView.separated(
                          itemCount: widget.country.places.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 20);
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final Trip trip = widget.country.places[index];
                            return SlideTransition(
                              position: _listAnimation,
                              child: NormalCard(
                                isCountry: true,
                                trip: trip,
                                isTextWhite: true,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
