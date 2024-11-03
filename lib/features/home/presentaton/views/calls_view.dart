import 'package:chat/core/constants/asset_images.dart';
import 'package:flutter/material.dart';

class CallsView extends StatefulWidget {
  const CallsView({super.key});

  @override
  State<CallsView> createState() => _CallsViewState();
}

class _CallsViewState extends State<CallsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const Padding(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Recent',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            )),
        ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(Assets.assetsImagesProfile),
              ),
              title: Text(
                'Moka',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Today, 12:25 PM',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              trailing: Icon(Icons.call),
            );
          },
        ),
      ],
    );
  }
}
