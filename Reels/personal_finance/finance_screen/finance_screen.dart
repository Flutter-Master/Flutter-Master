import 'package:flutter/material.dart';
import 'package:testing/personal_finance/constants.dart';
import 'package:testing/personal_finance/finance_screen/widgets/expense_page_view.dart';
import 'package:testing/personal_finance/finance_screen/widgets/switcher.dart';

class FinanceScreen extends StatefulWidget {
  @override
  _FinanceScreenState createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  // keeping track of which
  // graph to show
  int _graphIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // graph
          Expanded(
            child: ExpensePageView(
              graphIndex: _graphIndex,
            ),
          ),
          // bottom sheet
          Container(
            width: double.infinity,
            height: 336.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF6F6F6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 28.0,
                ),
                Switcher(
                  whichGraph: (int graphIndex) {
                    setState(() {
                      _graphIndex = graphIndex;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
