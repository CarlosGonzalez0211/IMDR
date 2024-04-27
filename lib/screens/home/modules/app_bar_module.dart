import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppBarModule extends StatelessWidget implements PreferredSizeWidget {
  final User? userData;
  const AppBarModule({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // AppBar background color
      elevation: 0, // Remove shadow
      flexibleSpace: SafeArea( // Wrap the content in a SafeArea widget
        child: Padding(
          padding: const EdgeInsets.all(16), // Add padding around the edges
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Align title in the available space
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              const Text(
                'Hello,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              const FittedBox( // Wrap the second text widget to prevent it from being cropped
                fit: BoxFit.fitWidth, // This will scale the text down if it doesn't fit
                child: Text(
                  'Good Morning',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  userData?.displayName?.split(" ")[0] ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black, size: 32,),
          onPressed: () {
            // Implement search action
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black, size: 32,),
          onPressed: () {
            // Implement notification action
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: userData?.photoURL != null ? NetworkImage(userData!.photoURL!) : null,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(124.0);
}
