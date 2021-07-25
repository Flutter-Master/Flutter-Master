//to use extension methods, make sure
//your SDK has following configuration
//in pubspec.yaml

//!     environment:
//!       sdk: ">=2.7.0 <3.0.0"

extension Circle on double {
  /// Calculate area of circle from
  /// the radius
  double get calculateArea => 3.1416 * this * this; // π * r * r

  /// Calculate border of circle from
  /// the radius
  double get calculateBorder => 2 * 3.1416 * this; // 2 * π * r

  /// Divide radius of Circle by
  /// two
  double get reduceToHalf => this / 2;
}

void main() {
  //radius of circle
  double radius = 5.0;

  //getting area of circle
  double area = radius.calculateArea;

  //getting border of circle
  double border = radius.calculateBorder;

  //chaining of extension methods
  radius.reduceToHalf.calculateArea;

  //printing to the console
  print('Area: $area');
  print('Border: $border');
}
