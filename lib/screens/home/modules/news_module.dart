import 'package:flutter/material.dart';

import '../../../services/managers/news_manager.dart';
import '../widgets/news_item_widget.dart';

class NewsSectionModule extends StatelessWidget {
  final NewsManager newsManager = NewsManager();

  NewsSectionModule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
        Expanded( // Wrap with Expanded
          child: StreamBuilder<List<NewsItem>>(
            stream: newsManager.newsStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final newsItems = snapshot.data!;
                return ListView.builder( // Use ListView.builder
                  physics: const NeverScrollableScrollPhysics(), // Add this line
                  itemCount: newsItems.length,
                  itemBuilder: (context, index) {
                    return newsItems[index];
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}