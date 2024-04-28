import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../chat_screen.dart';
import '../widgets/message_item_widget.dart';

class ChatScreenList extends StatelessWidget {
  final User? userData;

  const ChatScreenList({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {
            // Placeholder for edit action
          },
        ),
        title: const Text('Ask Lepia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.create),
            onPressed: () {
              // Placeholder for create action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5, // Define the number of chat items here
        itemBuilder: (context, index) {
          // Check if the item is the first one
          if (index == 0) {
            // Provide an editable chat item for the first item
            return ListTile(
              leading: ClipOval(
                child: SvgPicture.asset(
                  'assets/asset_logo.svg',
                  width: 40,  // The size of the avatar
                  height: 40, // The size of the avatar
                  fit: BoxFit.cover, // Adjust the fit to your needs
                ),
              ),
              title: const Text(
                'Lepia',
                style: TextStyle(color: Colors.black),
              ),
              subtitle: const Text('Your personal AI Medical Consultant'), // Placeholder for last message
              trailing: const Icon(Icons.edit), // Placeholder for edit icon
              onTap: () {
                navigateToScreen(context);
              },
            );
          } else {
            // Generate the other chat items automatically
            return MessageChatItem(
              userName: 'User $index',
              messagePreview: 'Last message here...',
              time: '01:35',
              avatarUrl: 'https://via.placeholder.com/150',
              unreadMessages: index,
              onlineStatus: index % 2 == 0,
              onTap: () {
                print('Tapped on User $index');
              },
            );
          }
        },
      ),
    );
  }

  void navigateToScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LepiaChatScreen(userData: userData,)),
    );
  }

}
