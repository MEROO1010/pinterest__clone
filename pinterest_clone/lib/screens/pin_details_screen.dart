import 'package:flutter/material.dart';
import '../models/pin.dart';

class PinDetailsScreen extends StatelessWidget {
  final Pin pin;

  PinDetailsScreen(this.pin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pin.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(pin.imageUrl),
            SizedBox(height: 10),
            Text(
              pin.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(pin.description),
          ],
        ),
      ),
    );
  }
}
