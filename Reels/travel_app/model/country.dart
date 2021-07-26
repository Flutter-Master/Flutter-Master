import 'dart:convert';

import 'package:collection/collection.dart';

import 'trip.dart';

class Country {
  final String name;
  final String totalPlaces;
  final String image;
  final String description;
  final List<Trip> places;
  Country({
    required this.name,
    required this.totalPlaces,
    required this.places,
    required this.image,
    required this.description,
  });

  Country copyWith({
    String? name,
    String? totalPlaces,
    String? image,
    String? description,
    List<Trip>? places,
  }) {
    return Country(
      name: name ?? this.name,
      totalPlaces: totalPlaces ?? this.totalPlaces,
      image: image ?? this.image,
      places: places ?? this.places,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'totalPlaces': totalPlaces,
      'places': places.map((x) => x.toMap()).toList(),
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    final List<Trip> places = map['places']
        .map<Trip>((Map<String, dynamic> p) => Trip.fromMap(p))
        .toList() as List<Trip>;

    return Country(
      name: map['name'] as String,
      totalPlaces: map['totalPlaces'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      places: places,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'Country(name: $name, totalPlaces: $totalPlaces, places: $places)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Country &&
        other.name == name &&
        other.totalPlaces == totalPlaces &&
        listEquals(other.places, places);
  }

  @override
  int get hashCode => name.hashCode ^ totalPlaces.hashCode ^ places.hashCode;
}
