import 'package:chat/core/constants/asset_images.dart';
import 'package:chat/core/themes/colors_app.dart';
import 'package:chat/features/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatListile extends StatelessWidget {
  const ChatListile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.transparent,
        elevation: 0,
        child: ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(Assets.assetsImagesProfile),
          ),
          title: const Text(
            'Karim',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Row(
            children: [
              const Icon(Icons.done_all, color: Colors.grey, size: 20),
              const SizedBox(width: 5),
              const Text(
                'This is the last message',
                style: const TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
          trailing: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('07:00 PM'),
              const SizedBox(height: 5),
              const CircleAvatar(
                radius: 12,
                backgroundColor: ColorApp.primaryColor,
                child: const Center(
                  child: const Text(
                    '5',
                    maxLines: 1,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
          onTap: () {
            // navigatePush(context, const CallsView());
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ChatScreen(),
            ));
          },
        ));
  }
}
