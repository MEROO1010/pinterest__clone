import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/board.dart';

class BoardProvider with ChangeNotifier {
  List<Board> _boards = [];

  List<Board> get boards {
    return [..._boards];
  }

  Future<void> fetchBoards() async {
    final url = Uri.parse('http://localhost:5000/api/boards');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      final List<Board> loadedBoards = [];
      for (var boardData in extractedData) {
        loadedBoards.add(Board.fromJson(boardData));
      }
      _boards = loadedBoards;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addBoard(Board board) async {
    final url = Uri.parse('http://localhost:5000/api/boards');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(board.toJson()),
      );
      final newBoard = Board.fromJson(json.decode(response.body));
      _boards.add(newBoard);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateBoard(String id, Board newBoard) async {
    final boardIndex = _boards.indexWhere((board) => board.id == id);
    if (boardIndex >= 0) {
      final url = Uri.parse('http://localhost:5000/api/boards/$id');
      await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newBoard.toJson()),
      );
      _boards[boardIndex] = newBoard;
      notifyListeners();
    }
  }

  Future<void> deleteBoard(String id) async {
    final url = Uri.parse('http://localhost:5000/api/boards/$id');
    final existingBoardIndex = _boards.indexWhere((board) => board.id == id);
    Board? existingBoard = _boards[existingBoardIndex];
    _boards.removeAt(existingBoardIndex);
    notifyListeners();

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _boards.insert(existingBoardIndex, existingBoard);
      notifyListeners();
      throw Exception('Could not delete board.');
    }
    existingBoard = null;
  }
}
