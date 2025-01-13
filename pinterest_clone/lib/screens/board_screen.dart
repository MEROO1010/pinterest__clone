import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/board_provider.dart';

class BoardScreen extends StatelessWidget {
  final String boardId;

  BoardScreen(this.boardId);

  @override
  Widget build(BuildContext context) {
    final board = Provider.of<BoardProvider>(
      context,
    ).boards.firstWhere((b) => b.id == boardId);

    return Scaffold(
      appBar: AppBar(title: Text(board.name)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: board.pins.length,
        itemBuilder:
            (ctx, i) => Card(
              child: Column(
                children: [
                  Image.network(board.pins[i].imageUrl),
                  Text(board.pins[i].title),
                ],
              ),
            ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
