import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:testing/personal_finance/constants.dart';
import 'package:testing/personal_finance/finance_screen/widgets/income_graph.dart';

import 'expense_graph.dart';

class ExpensePageView extends StatelessWidget {
  // which graph to show
  final int graphIndex;

  const ExpensePageView({
    Key key,
    @required this.graphIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              'January',
              style: TextStyle(
                color: kPrimaryTextColor,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: 70.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        '2020',
                        style: TextStyle(
                          color: kPurpleColor.withOpacity(0.8),
                          fontSize: 11.0,
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.chevron_right,
                          size: 14.0,
                          color: kPurpleColor.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  child: Icon(
                    Icons.autorenew,
                    size: 16.0,
                    color: kPurpleColor.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Center(
            child: graphIndex == 0 ? ExpenseGraph() : IncomeGraph(),
          ),
        ],
      ),
    );
  }
}

/// Custom Painter class for painting the rings
class RingsPainter extends CustomPainter {
  // angle for blue ring
  final double blueAngle;
  // angle for purple ring
  final double purpleAngle;
  // angle for yellow ring
  final double yellowAngle;

  RingsPainter({
    @required this.blueAngle,
    @required this.purpleAngle,
    @required this.yellowAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round;

    _paint.color = const Color(0xFFF6F6F6);
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      -math.pi / 2,
      2 * math.pi,
      false,
      _paint,
    );

    _paint.color = kBlueColor;
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      -math.pi / 2,
      blueAngle,
      false,
      _paint,
    );

    _paint.color = kPurpleColor;
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      -math.pi / 2,
      purpleAngle,
      false,
      _paint,
    );

    _paint.color = kOrangeColor;
    canvas.drawArc(
      Rect.fromLTWH(0.0, 0.0, size.width, size.height),
      -math.pi / 2,
      yellowAngle,
      false,
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
