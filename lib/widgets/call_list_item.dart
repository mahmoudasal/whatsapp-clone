import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/call_model.dart';
import '../navigation/app_routes.dart';

class CallListItem extends StatelessWidget {
  final CallModel call;

  const CallListItem({super.key, required this.call});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(call.avatarUrl),
      ),
      title: Text(
        call.name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      subtitle: Row(
        children: [
          Icon(
            call.isOutgoing
                ? CupertinoIcons.arrow_up_right
                : CupertinoIcons.arrow_down_left,
            color: call.isMissed ? Colors.red : Colors.green,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            call.time,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          call.isVideo ? CupertinoIcons.video_camera : CupertinoIcons.phone,
          color: Colors.blue,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.callDetail, arguments: call);
        },
      ),
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.callDetail, arguments: call);
      },
    );
  }
}
