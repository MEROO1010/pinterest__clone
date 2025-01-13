import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pinterest_clone/utils/constants.dart';
import '../models/board.dart';
import '../models/pin.dart';
import '../models/user.dart';

class ApiService {
  static Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse(Constants.registerUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register user');
    }
  }

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse(Constants.loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  static Future<List<Board>> fetchBoards() async {
    final response = await http.get(Uri.parse(Constants.boardsUrl));

    if (response.statusCode == 200) {
      final List<dynamic> boardList = json.decode(response.body);
      return boardList.map((json) => Board.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load boards');
    }
  }

  static Future<List<Pin>> fetchPins() async {
    final response = await http.get(Uri.parse(Constants.pinsUrl));

    if (response.statusCode == 200) {
      final List<dynamic> pinList = json.decode(response.body);
      return pinList.map((json) => Pin.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pins');
    }
  }

  static Future<User> fetchUser(String userId) async {
    final response = await http.get(Uri.parse('${Constants.usersUrl}/$userId'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  static Future<void> addBoard(Board board) async {
    final response = await http.post(
      Uri.parse(Constants.boardsUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(board.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add board');
    }
  }

  static Future<void> addPin(Pin pin) async {
    final response = await http.post(
      Uri.parse(Constants.pinsUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(pin.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add pin');
    }
  }

  static Future<void> updateBoard(String id, Board board) async {
    final response = await http.put(
      Uri.parse('${Constants.boardsUrl}/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(board.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update board');
    }
  }

  static Future<void> updatePin(String id, Pin pin) async {
    final response = await http.put(
      Uri.parse('${Constants.pinsUrl}/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(pin.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update pin');
    }
  }

  static Future<void> deleteBoard(String id) async {
    final response = await http.delete(Uri.parse('${Constants.boardsUrl}/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete board');
    }
  }

  static Future<void> deletePin(String id) async {
    final response = await http.delete(Uri.parse('${Constants.pinsUrl}/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete pin');
    }
  }
}
