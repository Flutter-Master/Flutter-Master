import 'dart:convert';

class Trip {
  final String title;
  final String duration;
  final String image;
  final String? extraDuration;
  final String destination;
  final String price;
  final String? experiences;

  Trip({
    required this.image,
    required this.title,
    required this.duration,
    this.extraDuration,
    required this.destination,
    required this.price,
    this.experiences,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'duration': duration,
      'extraDuration': extraDuration,
      'destination': destination,
      'price': price,
      'experiences': experiences,
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      title: map['title'] as String,
      image: map['image'] as String,
      duration: map['duration'] as String,
      extraDuration: map['extraDuration'] as String,
      destination: map['destination'] as String,
      price: map['price'] as String,
      experiences: map['experiences'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'Trip(title: $title, duration: $duration, extraDuration: $extraDuration, destination: $destination, price: $price, experiences: $experiences)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trip &&
        other.title == title &&
        other.duration == duration &&
        other.extraDuration == extraDuration &&
        other.destination == destination &&
        other.price == price &&
        other.experiences == experiences;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        duration.hashCode ^
        extraDuration.hashCode ^
        destination.hashCode ^
        price.hashCode ^
        experiences.hashCode;
  }
}
