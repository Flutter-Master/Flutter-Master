import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Will return the hook for page
/// controller
PageController usePageController() {
  return use(_PageControllerHook());
}

// private class for page controller hook
//
// Structure is similar to stateful widget
class _PageControllerHook extends Hook<PageController> {
  @override
  _PageControllerHookState createState() => _PageControllerHookState();
}

// state class for page controller hook
//
// All the primary login will go here
class _PageControllerHookState
    extends HookState<PageController, _PageControllerHook> {
  // page controller that will be
  // returned
  PageController _pageController;

  @override
  void initHook() {
    super.initHook();
    // initialising the page controller
    _pageController = PageController(
      initialPage: 2,
      keepPage: true,
      viewportFraction: 1.0,
    );
  }

  @override
  void dispose() {
    // disposing the page controller
    // when not needed
    _pageController.dispose();
    super.dispose();
  }

  // returning the created page controller
  @override
  PageController build(BuildContext context) => _pageController;
}
