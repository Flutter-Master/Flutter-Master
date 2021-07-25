import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:testing/on_boarding/constants.dart';

class PageThree extends StatefulWidget {
  // callback for theme
  final ValueChanged<bool> isDarkTheme;

  const PageThree({
    Key key,
    @required this.isDarkTheme,
  }) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  // keeping track of theme
  bool _isDarkTheme = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: _isDarkTheme ? kDarkBackgroundColor : kLightBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 280.0,
            height: 280.0,
            child: Lottie.asset(
              _isDarkTheme
                  ? 'assets/planet_dark.json'
                  : 'assets/planet_light.json',
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  'Select Preference',
                  style: TextStyle(
                    color: _isDarkTheme ? kWhiteColor : kDarkTextColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Dark Theme:',
                      style: TextStyle(
                        color: _isDarkTheme
                            ? kWhiteColor.withOpacity(0.8)
                            : kDarkTextColor.withOpacity(0.9),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    CupertinoSwitch(
                      value: _isDarkTheme,
                      onChanged: (newValue) {
                        setState(() {
                          _isDarkTheme = newValue;
                        });
                        widget.isDarkTheme(_isDarkTheme);
                      },
                      activeColor: kPrimaryColor,
                      trackColor: Colors.grey[300],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'Features you are likely to use:',
                  style: TextStyle(
                    color: _isDarkTheme
                        ? kWhiteColor.withOpacity(0.8)
                        : kDarkTextColor.withOpacity(0.9),
                    fontSize: 14.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 15.0,
                  children: <Widget>[
                    _ChipData(
                      title: 'Chatting',
                      isDarkTheme: _isDarkTheme,
                    ),
                    _ChipData(
                      title: 'Sharing photos',
                      isDarkTheme: _isDarkTheme,
                    ),
                    _ChipData(
                      title: 'Sharing documents',
                      isDarkTheme: _isDarkTheme,
                    ),
                    _ChipData(
                      title: 'Voice calling',
                      isDarkTheme: _isDarkTheme,
                    ),
                    _ChipData(
                      title: 'Video calling',
                      isDarkTheme: _isDarkTheme,
                    ),
                    _ChipData(
                      title: 'Connecting to people',
                      isDarkTheme: _isDarkTheme,
                    ),
                  ],
                ),
                SizedBox(
                  height: 65.0,
                ),
                Center(
                  child: MaterialButton(
                    splashColor: Colors.transparent,
                    minWidth: 150.0,
                    height: 50.0,
                    color: kPrimaryColor,
                    onPressed: () {},
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: kWhiteColor,
                      ),
                    ),
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

class _ChipData extends StatefulWidget {
  // title of chip
  final String title;
  // is dark theme or not
  final bool isDarkTheme;

  const _ChipData({
    Key key,
    @required this.title,
    @required this.isDarkTheme,
  }) : super(key: key);

  @override
  __ChipDataState createState() => __ChipDataState();
}

class __ChipDataState extends State<_ChipData> {
  // keeping track of chip selection
  bool _isSelected = false;

  // get color for text inside chip
  Color _getColorForText() {
    if (!widget.isDarkTheme) {
      return _isSelected ? kWhiteColor : kDarkTextColor.withOpacity(0.6);
    }
    return _isSelected ? kWhiteColor : kWhiteColor.withOpacity(0.5);
  }

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: _isSelected,
      shadowColor: Colors.transparent,
      label: Text(
        widget.title,
        style: TextStyle(
          color: _getColorForText(),
        ),
      ),
      onSelected: (newValue) {
        setState(() {
          _isSelected = newValue;
        });
      },
      selectedColor: kPrimaryColor,
      backgroundColor: widget.isDarkTheme ? Colors.grey[900] : Colors.grey[300],
      checkmarkColor: kWhiteColor,
    );
  }
}
