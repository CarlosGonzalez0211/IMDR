import 'package:flutter/material.dart';

class MessageChatItem extends StatelessWidget {
  final String userName;
  final String messagePreview;
  final String time;
  final String avatarUrl;
  final int unreadMessages;
  final bool onlineStatus;
  final VoidCallback onTap;

  const MessageChatItem({
    super.key,
    required this.userName,
    required this.messagePreview,
    required this.time,
    required this.avatarUrl,
    this.unreadMessages = 0,
    this.onlineStatus = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          if (onlineStatus) // Online indicator
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    width: 3,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(userName),
      subtitle: Text(messagePreview),
      trailing: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(time),
          if (unreadMessages > 0)
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: Text(
                unreadMessages.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      onTap: onTap,
    );
  }
}
