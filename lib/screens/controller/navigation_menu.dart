import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../chatapp/chat_screen.dart';
import '../chatapp/contacts/messages_list.dart';
import '../home/blueprint/home_blueprint.dart';

class NavigationController extends GetxController {
  final User? user;
  final Rx<int> selectedIndex = 0.obs;
  late List<Widget> screens;

  NavigationController({this.user}) {

    screens = [
      HomeScreen(user: user),
      Container(
        color: Colors.white,
      ),
      ChatScreenList(userData: user),
      Container(
        color: Colors.green,
      ),
    ];
  }
}

class NavigationMenu extends StatelessWidget {
  final User? user;

  const NavigationMenu({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Initialize the NavigationController with the user
    final NavigationController controller = Get.put(NavigationController(user: user));

    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
            // If you want to perform actions when changing tabs, you can add them here
          },
          destinations: const [
            NavigationDestination(icon: Icon(FontAwesomeIcons.house), label: "Home"),
            NavigationDestination(icon: Icon(FontAwesomeIcons.calendar), label: "Calendar"),
            NavigationDestination(icon: Icon(FontAwesomeIcons.comments), label: "Chat"),
            NavigationDestination(icon: Icon(FontAwesomeIcons.user), label: "Me"),
          ],
        ),
      ),
      body: Obx(
            () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}
