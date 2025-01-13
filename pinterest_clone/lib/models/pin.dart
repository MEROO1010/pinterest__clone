class Pin {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String userId;

  Pin({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
  });

  // Factory constructor to create a Pin from a JSON object
  factory Pin.fromJson(Map<String, dynamic> json) {
    return Pin(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      userId: json['userId'],
    );
  }

  // Method to convert a Pin object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'userId': userId,
    };
  }
}
