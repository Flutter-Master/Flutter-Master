import 'trip.dart';

final upcomingTripsMap = [
  {
    'title': 'Waipio Valley',
    'image': 'assets/images/upcoming_1.png',
    'duration': '4 days',
    'destination': 'Hawai, USA',
    'price': '\$386',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Glacier Hiking',
    'image': 'assets/images/upcoming_2.png',
    'duration': '3 days',
    'destination': 'Hardangervidda, Norway',
    'price': '\$149',
    'experiences':
        'Glaciers are found on every continent except for Australia. They need a specific climate: generally a lot of snowfall during the winter and relatively cool temperatures during the summer. Glacier Hiking has become a tourist attraction in some countries, but it requires special knowledge of the constantly-changing environments and glacial features. Hazards like crevasses and serac are difficult obstacles that glacier hikers should be aware of during this activity.',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Sagarda Familia',
    'image': 'assets/images/upcoming_3.png',
    'duration': '2 days',
    'destination': 'Barcelona, Spain',
    'price': '\$69',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Bora Bora Island',
    'image': 'assets/images/upcoming_4.png',
    'duration': '8 days',
    'destination': 'French Polynesia, France',
    'price': '\$489',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
];

final homeCountryMap = [
  {
    'title': 'Indian Highlights',
    'image': 'assets/images/home_country_1.png',
    'duration': '24 places',
    'destination': 'Hawai, USA',
    'price': '\$386',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Spanish Arch',
    'image': 'assets/images/home_country_2.png',
    'duration': '15 places',
    'destination': 'Hardangervidda, Norway',
    'price': '\$149',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Britian Palace',
    'image': 'assets/images/home_country_3.png',
    'duration': '14 places',
    'destination': 'Barcelona, Spain',
    'price': '\$69',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Scandinavia',
    'image': 'assets/images/home_country_4.png',
    'duration': '9 places',
    'destination': 'French Polynesia, France',
    'price': '\$489',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
];

final moodsMap = [
  {
    'title': 'Hiking',
    'image': 'assets/images/mood_1.png',
    'duration': '5 trips',
    'destination': 'Hawai, USA',
    'price': '\$386',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Paragliding',
    'image': 'assets/images/mood_2.png',
    'duration': '6 trips',
    'destination': 'Hardangervidda, Norway',
    'price': '\$149',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Museum',
    'image': 'assets/images/mood_3.png',
    'duration': '8 trips',
    'destination': 'Barcelona, Spain',
    'price': '\$69',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
  {
    'title': 'Historical',
    'image': 'assets/images/mood_4.png',
    'duration': '5 trips',
    'destination': 'French Polynesia, France',
    'price': '\$489',
    'experiences': 'Something goes here',
    'extraDuration': 'For 3 days and 2 nights',
  },
];

final List<Trip> upcomingTrips =
    upcomingTripsMap.map((map) => Trip.fromMap(map)).toList();

final List<Trip> countryTrips =
    homeCountryMap.map((map) => Trip.fromMap(map)).toList();
final List<Trip> moodTrips = moodsMap.map((map) => Trip.fromMap(map)).toList();
