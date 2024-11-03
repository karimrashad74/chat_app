import 'package:chat/features/home/presentaton/views/new_group_view.dart';
import 'package:chat/features/home/presentaton/views/profile_view.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("What's App"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        PopupMenuButton<String>(
          elevation: 0,
          position: PopupMenuPosition.under,
          onSelected: (String value) {
            print(value);
          },
          constraints: const BoxConstraints(
            minWidth: 200,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                value: 'New Group',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NewGroupView(),
                  ));
                },
                child: const Row(
                  children: [
                    const Icon(Icons.add),
                    const Text('New Group',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              PopupMenuItem<String>(
                value: 'Profile',
                child: const Row(
                  children: [
                    const Icon(Icons.account_circle_sharp),
                    const Text('Profile',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ProfileView(),
                  ));
                },
              ),
              const PopupMenuItem<String>(
                value: ' Settings',
                child: Row(
                  children: [
                    Icon(Icons.settings),
                    Text('Settings',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: ' Logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    Text('Logout',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ];
          },
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
