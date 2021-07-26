import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../button/platform_button.dart';

class CustomButton {
  ///Expanded Full Width Button
  ///
  ///Customizable with custom width
  ///
  ///[Default isLoading is false]
  static Widget expanded({
    required BuildContext context,
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
    double? width,
  }) {
    return PlatformButton(
      width: width ?? double.infinity,
      backgroundColor: Colors.black,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      borderRadius: BorderRadius.circular(0),
      onPressed: isLoading ? () {} : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.button!.copyWith(
                    color: Colors.white,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w800,
                  ),
            ),
    );
  }
}
