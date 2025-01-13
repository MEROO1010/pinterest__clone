import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  late User _user;

  User get user {
    return _user;
  }

  Future<void> fetchUser(String userId) async {
    final url = Uri.parse('http://localhost:5000/api/users/$userId');
    try {
      final response = await http.get(url);
      final userData = json.decode(response.body);
      _user = User.fromJson(userData);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateUser(User newUser) async {
    final url = Uri.parse('http://localhost:5000/api/users/${newUser.id}');
    try {
      await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newUser.toJson()),
      );
      _user = newUser;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
