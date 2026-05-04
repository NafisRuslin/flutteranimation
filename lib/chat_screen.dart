import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️ Chat'),
        backgroundColor: Colors.lightBlueAccent,
        actions: [IconButton(icon: const Icon(Icons.logout), onPressed: () => Navigator.pop(context))],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                ChatBubble(text: "Hey! Is the app ready?", isMe: false),
                ChatBubble(text: "Yes! The typewriter animation is working!", isMe: true),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.lightBlueAccent, width: 2))),
            child: Row(
              children: [
                const Expanded(child: TextField(decoration: InputDecoration(hintText: 'Type message...'))),
                IconButton(icon: const Icon(Icons.send, color: Colors.lightBlueAccent), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;
  const ChatBubble({super.key, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30),
              bottomLeft: const Radius.circular(30),
              bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(30),
              topRight: isMe ? const Radius.circular(30) : const Radius.circular(0),
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(text, style: TextStyle(color: isMe ? Colors.white : Colors.black, fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}