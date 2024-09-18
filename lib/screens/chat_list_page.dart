import 'package:flutter/material.dart';
import 'package:sure_crop/screens/buyer_home_page.dart';

import 'chat_page.dart'; // Make sure you import the ChatPage class

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final List<Map<String, String>> chatList = [
    {'name': 'Shekhar', 'lastMessage': 'Hey! How are you?'},
    {'name': 'Ramu', 'lastMessage': 'Let’s meet tomorrow.'},
    {'name': 'Shankar', 'lastMessage': 'Got it!'},
    {'name': 'Wasee', 'lastMessage': 'Thanks!'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];

          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 2,
                )
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: primaryCol,
                child: Text(
                  chat['name']![0], // First letter of the name
                  style: TextStyle(color: Colors.white),
                ),
              ),
              title: Text(chat['name']!),
              subtitle: Text(chat['lastMessage']!),
              onTap: () {
                // Navigate to the ChatPage when a chat is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(userName: chat['name']!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
