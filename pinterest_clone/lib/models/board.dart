import 'pin.dart';

class Board {
  final String id;
  final String name;
  final String description;
  final List<Pin> pins;

  Board({
    required this.id,
    required this.name,
    required this.description,
    required this.pins,
  });

  // Factory constructor to create a Board from a JSON object
  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pins: (json['pins'] as List).map((pin) => Pin.fromJson(pin)).toList(),
    );
  }

  // Method to convert a Board object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'pins': pins.map((pin) => pin.toJson()).toList(),
    };
  }
}
