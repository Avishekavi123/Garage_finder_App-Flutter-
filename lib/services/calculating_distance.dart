

import 'dart:math';

class Location {
  double latitude;
  double longitude;

  Location(this.latitude, this.longitude);
}

double calculateDistance(Location location1, Location location2) {
  final double earthRadius = 6371; // in kilometers

  double lat1 = _degreesToRadians(location1.latitude);
  double lon1 = _degreesToRadians(location1.longitude);
  double lat2 = _degreesToRadians(location2.latitude);
  double lon2 = _degreesToRadians(location2.longitude);

  double dLat = lat2 - lat1;
  double dLon = lon2 - lon1;

  double a = pow(sin(dLat / 2), 2) +
      cos(lat1) * cos(lat2) * pow(sin(dLon / 2), 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double distance = earthRadius * c;
  return distance;
}

double _degreesToRadians(double degrees) {
  return degrees * (pi / 180);
}

void main() {
  // Example usage
  Location location1 = Location(23.520008, 13.404954); // Berlin coordinates
  Location location2 = Location(48.8566, 2.3522); // Paris coordinates

  double distance = calculateDistance(location1, location2);
  print('The distance between the two locations is ${distance.toStringAsFixed(2)} km.');
}

