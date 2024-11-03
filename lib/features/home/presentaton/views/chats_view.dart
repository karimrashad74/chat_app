import 'package:chat/features/home/presentaton/views/widgets/chat_listile.dart';
import 'package:chat/features/home/presentaton/views/widgets/massagebutton.dart';
import 'package:flutter/material.dart';

class ChatsView extends StatefulWidget {
  const ChatsView({super.key});

  @override
  State<ChatsView> createState() => _ChatsViewState();
}

class _ChatsViewState extends State<ChatsView> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
        itemCount: 8,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const ChatListile();
        },
      ),
      const Positioned(bottom: 20, right: 20, child: Massagebutton()),
    ]);
  }
}
