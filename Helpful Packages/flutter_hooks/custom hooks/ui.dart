import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:testapp/page_controller_hook.dart';

class UI extends HookWidget {
  // list of background colors
  final List<Color> _colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    // getting the hook for page
    // controller
    final _pageController = usePageController();
    return Scaffold(
      body: PageView.builder(
        // using the hook, as you would use
        // normal page controller
        controller: _pageController,
        itemCount: _colors.length,
        itemBuilder: (context, index) {
          return Container(
            color: _colors[index],
          );
        },
      ),
    );
  }
}
