import 'package:alpha/screens/chatTabs/chatModel.dart';
import 'package:alpha/screens/chatTabs/individualChatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);

  final ChatModel user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => IndividualChatPage(
              chatModel: user,
            ),
          ),
        );
      },
      child: ListTile(
        leading: const CircleAvatar(
          radius: 23,
          child: Icon(
            Icons.person_sharp,
            size: 30,
          ),
        ),
        title: Text(
          user.name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '${user.course}  ${user.branch}  ${user.year} Year',
          style: const TextStyle(fontSize: 13),
        ),
      ),
    );
  }
}
