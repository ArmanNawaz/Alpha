import 'package:alpha/userCard.dart';
import 'package:flutter/material.dart';
import 'chatModel.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key, required this.details}) : super(key: key);

  final List details;

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<ChatModel> users = [
    ChatModel(name: 'Jugal Singh', course: 'BTech', branch: 'CSE'),
    ChatModel(name: 'Ashish Srivastava', course: 'BTech', branch: 'CSE'),
    ChatModel(name: 'Prabhat Srivastava', course: 'BTech', branch: 'EE'),
    ChatModel(name: 'Anand Mishra', course: 'BTech', branch: 'ME'),
    ChatModel(name: 'Niket Singh', course: 'BTech', branch: 'CSE'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select User',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${widget.details.length} Users',
                  style: const TextStyle(fontSize: 13),
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
