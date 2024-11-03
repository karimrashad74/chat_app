import 'package:chat/features/status/presentation/views/widgets/add_status.dart';
import 'package:chat/features/status/presentation/views/widgets/recent_status.dart';
import 'package:chat/features/status/presentation/views/widgets/update_status.dart';
import 'package:flutter/material.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: const [
        AddStatus(),
        Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Recent updates',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            )),
        RecentStatus(),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Viewed updates',
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            )),
        SizedBox(height: 10),
        UpdateStatus(),
      ],
    );
  }
}
