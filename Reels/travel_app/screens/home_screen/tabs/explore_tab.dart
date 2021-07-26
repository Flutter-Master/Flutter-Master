import 'package:flutter/material.dart';
import 'package:tourve/core/navigation.dart';
import 'package:tourve/model/country.dart';
import 'package:tourve/model/country_data.dart';

import '../../../constant.dart';
import '../../country_screen/country_screen.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({Key? key}) : super(key: key);

  @override
  _ExploreTabState createState() => _ExploreTabState();
}

class _ExploreTabState extends State<ExploreTab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      addItems();
    });
  }

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final List<Country> list = [];

  void addItems() {
    Future f = Future(() {});
    countryList.forEach((e) async {
      f = f.then((value) {
        return Future.delayed(const Duration(milliseconds: 200)).then((value) {
          list.add(e);
          listKey.currentState!.insertItem(
            list.length - 1,
          );
        });
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 75),
          //TItle
          Hero(
            tag: 'tourve',
            child: Center(
              child: Text(
                'EXPLORE',
                style: kLargeTitle.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 50),

          AnimatedList(
            key: listKey,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            initialItemCount: list.length,
            itemBuilder: (context, index, animation) {
              final country = countryList[index];
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(0.2, 0), end: const Offset(0, 0))
                    .animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeOut),
                ),
                child: Column(
                  children: [
                    CountryCard(country: country, animation: animation),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key? key,
    required this.country,
    required this.animation,
  }) : super(key: key);

  final Country country;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(context, CountryScreen(country: country));
      },
      child: SizedBox(
        height: 197,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: country.name,
              child: Container(
                height: 173,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(country.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            //TEXT BOX
            Positioned(
              bottom: 2,
              left: 15,
              child: FadeTransition(
                opacity: animation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      country.totalPlaces,
                      // '21 places',
                      style: kQuoteStyle.copyWith(
                        fontSize: 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    // SizedBox(height: rh(5)),
                    Text(
                      country.name,
                      // 'ITALY',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 64,
                        height: 1,
                        fontWeight: FontWeight.w900,
                        shadows: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
