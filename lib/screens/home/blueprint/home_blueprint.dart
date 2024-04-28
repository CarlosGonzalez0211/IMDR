import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/managers/news_manager.dart';
import '../modules/app_bar_module.dart';
import '../modules/horizontal_menu_module.dart';
import '../modules/schedule_module.dart';
import '../widgets/news_item_widget.dart';

class HomeScreen extends StatefulWidget {
  final User? user;
  const HomeScreen({super.key, this.user});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsManager newsManager = NewsManager();

  @override
  Widget build(BuildContext context) {
    // Handle null user case
    if (widget.user == null) {
      // Redirect to login or show an appropriate message
      return const Scaffold(
        appBar: AppBarModule(),
        body: Center(
          child: Text("No user is signed in."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarModule(userData: widget.user),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            const HorizontalMenuModule(),
            const SizedBox(height: 10,),
            ScheduleList(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 100),
                      Text(
                        'Our Latest',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 150),
                      Text(
                        'Health Notes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Learn about the lastests News in your country!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<List<NewsItem>>(
              stream: newsManager.newsStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final newsItems = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true, // Add this line
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: newsItems.length,
                    itemBuilder: (context, index) {
                      return newsItems[index]; // Assuming NewsItemWidget is your widget
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}