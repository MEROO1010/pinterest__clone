import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import '../providers/board_provider.dart';
import '../widgets/board_widget.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final boardProvider = Provider.of<BoardProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(userProvider.user.name)),
      body: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(userProvider.user.profileImageUrl),
          ),
          SizedBox(height: 10),
          Text(userProvider.user.name, style: TextStyle(fontSize: 20)),
          SizedBox(height: 10),
          Text(userProvider.user.email),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: boardProvider.boards.length,
              itemBuilder: (ctx, i) => BoardWidget(boardProvider.boards[i]),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
