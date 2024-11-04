import 'package:chat/core/constants/asset_images.dart';
import 'package:flutter/material.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppbar({super.key});
  @override
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      leading: Image.asset(Assets.assetsImagesProfile),
      title: const Text('Karim'),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.video_camera_back_rounded),
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
