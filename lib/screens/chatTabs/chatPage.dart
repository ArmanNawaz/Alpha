import 'package:alpha/customCard.dart';
import 'package:flutter/material.dart';
import 'chatModel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(name: "Jugal Singh", timer: '12:35', currentMessage: "Hii"),
    ChatModel(name: "Niket Singh", timer: '12:55', currentMessage: "Hello"),
    ChatModel(
        name: "Prabhat Srivastava", timer: '18:38', currentMessage: "Ciao"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
