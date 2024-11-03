import 'package:chat/core/themes/colors_app.dart';
import 'package:chat/features/home/presentaton/views/calls_view.dart';
import 'package:chat/features/home/presentaton/views/chats_view.dart';
import 'package:chat/features/home/presentaton/views/widgets/app_bar.dart';
import 'package:chat/features/status/presentation/views/status_view.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const ChatsView(),
    const StatusView(),
    const CallsView(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedItemColor: ColorApp.primaryColor,
        onTap: onTap,
        currentIndex: currentIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              color: ColorApp.primaryColor,
            ),
            label: 'Chats',
            tooltip: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.tips_and_updates_rounded,
              color: ColorApp.primaryColor,
            ),
            label: 'Status',
            tooltip: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.call,
              color: ColorApp.primaryColor,
            ),
            label: 'Calls',
            tooltip: 'Calls',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
    );
  }
}
