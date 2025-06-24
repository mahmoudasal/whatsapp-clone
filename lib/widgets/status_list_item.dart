import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/status_model.dart';
import '../navigation/app_routes.dart';

class StatusListItem extends StatelessWidget {
  final StatusModel status;
  final bool isMyStatus;

  const StatusListItem({
    super.key,
    required this.status,
    this.isMyStatus = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: status.isViewed ? Colors.grey : Colors.green,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(backgroundImage: NetworkImage(status.avatarUrl)),
        ),
      ),
      title: Text(
        status.name,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
      subtitle: Text(
        status.time,
        style: TextStyle(
          color: isMyStatus ? Colors.blue : Colors.grey,
          fontSize: 14,
        ),
      ),
      trailing: status.isMuted
          ? const Icon(CupertinoIcons.volume_mute, color: Colors.grey, size: 20)
          : null,
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.statusDetail, arguments: status);
      },
    );
  }
}
