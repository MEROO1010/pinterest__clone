import 'package:flutter/material.dart';
import '../models/pin.dart';
import '../screens/pin_details_screen.dart';

class PinWidget extends StatelessWidget {
  final Pin pin;

  PinWidget(this.pin);

  void selectPin(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => PinDetailsScreen(pin)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectPin(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(pin.imageUrl),
            Text(
              pin.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(pin.description, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
