class User {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });

  // Factory constructor to create a User from a JSON object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  // Method to convert a User object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImageUrl': profileImageUrl,
    };
  }
}
