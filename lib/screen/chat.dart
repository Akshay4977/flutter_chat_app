import 'package:chat_app_in_flutter/widgets/chat_message.dart';
import 'package:chat_app_in_flutter/widgets/new_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter chat'),
      ),
      body: Column(
        children: const [
          Expanded(child: ChatMessages()),
          NewMessages(),
        ],
      ),
    );
  }
}
