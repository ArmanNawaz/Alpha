import 'package:alpha/screens/chatTabs/chatPage.dart';
import 'package:alpha/screens/chatTabs/userPage.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // tabController = TabController(
    //   length: 2,
    //   vsync: this,
    //   initialIndex: 0,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Chat',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            )
          ],
          bottom: TabBar(
            tabs: const [
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Users',
              )
            ],
            controller: tabController,
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            ChatPage(),
            UserPage(),
          ],
        ),
      ),
    );
  }
}
