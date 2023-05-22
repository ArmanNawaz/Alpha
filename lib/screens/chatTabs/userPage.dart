import 'package:alpha/userCard.dart';
import 'package:flutter/material.dart';
import 'chatModel.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel2> users = [
      ChatModel2(name: 'Jugal Singh', course: 'BTech', branch: 'CSE'),
      ChatModel2(name: 'Ashish Srivastava', course: 'BTech', branch: 'CSE'),
      ChatModel2(name: 'Prabhat Srivastava', course: 'BTech', branch: 'EE'),
      ChatModel2(name: 'Anand Mishra', course: 'BTech', branch: 'ME'),
      ChatModel2(name: 'Niket Singh', course: 'BTech', branch: 'CSE'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Select User',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '256 Users',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            const Icon(Icons.file_copy),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => UserCard(
          user: users[index],
        ),
      ),
    );
  }
}
