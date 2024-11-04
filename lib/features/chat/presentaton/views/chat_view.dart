import 'package:chat/features/chat/presentaton/views/widgets/chat_appbar.dart';
import 'package:chat/features/chat/presentaton/views/widgets/input_text.dart';
import 'package:chat/features/chat/presentaton/views/widgets/message_bubble.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  List<String> messages = [];

  void _addMessage(String message) {
    setState(() {
      messages.add(message);
    });
  }

  void _deleteMessage(int index) {
    setState(() {
      messages.removeAt(index);
    });
  }

  void _editMessage(int index, String newMessage) {
    setState(() {
      messages[index] = newMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ChatAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return MessageBubble(
                  message: messages[index],
                  onDelete: () => _deleteMessage(index),
                  onEdit: (newMessage) => _editMessage(index, newMessage),
                );
              },
            ),
          ),
          InputText(onSendMessage: _addMessage),
        ],
      ),
    );
  }
}
