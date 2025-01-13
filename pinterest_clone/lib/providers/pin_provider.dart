import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/pin.dart';

class PinProvider with ChangeNotifier {
  List<Pin> _pins = [];

  List<Pin> get pins {
    return [..._pins];
  }

  Future<void> fetchPins() async {
    final url = Uri.parse('http://localhost:5000/api/pins');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      final List<Pin> loadedPins = [];
      for (var pinData in extractedData) {
        loadedPins.add(Pin.fromJson(pinData));
      }
      _pins = loadedPins;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addPin(Pin pin) async {
    final url = Uri.parse('http://localhost:5000/api/pins');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(pin.toJson()),
      );
      final newPin = Pin.fromJson(json.decode(response.body));
      _pins.add(newPin);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updatePin(String id, Pin newPin) async {
    final pinIndex = _pins.indexWhere((pin) => pin.id == id);
    if (pinIndex >= 0) {
      final url = Uri.parse('http://localhost:5000/api/pins/$id');
      await http.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(newPin.toJson()),
      );
      _pins[pinIndex] = newPin;
      notifyListeners();
    }
  }

  Future<void> deletePin(String id) async {
    final url = Uri.parse('http://localhost:5000/api/pins/$id');
    final existingPinIndex = _pins.indexWhere((pin) => pin.id == id);
    Pin? existingPin = _pins[existingPinIndex];
    _pins.removeAt(existingPinIndex);
    notifyListeners();

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      _pins.insert(existingPinIndex, existingPin);
      notifyListeners();
      throw Exception('Could not delete pin.');
    }
    existingPin = null;
  }
}
