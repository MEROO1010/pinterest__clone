import 'package:flutter/material.dart';
import '../models/board.dart';
import '../screens/board_screen.dart';

class BoardWidget extends StatelessWidget {
  final Board board;

  BoardWidget(this.board);

  void selectBoard(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => BoardScreen(board.id)));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectBoard(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              board.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(board.description, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
