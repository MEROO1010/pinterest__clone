import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;

  ProfileWidget(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(user.profileImageUrl),
          ),
          SizedBox(height: 10),
          Text(
            user.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(user.email, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Implement functionality to follow/unfollow user
            },
            child: Text('Follow'),
          ),
        ],
      ),
    );
  }
}
