import 'package:flutter/material.dart';

import '../widgets/news_item_widget.dart';

class NewsSectionModule extends StatelessWidget {
  final List<NewsItem> newsItems;

  const NewsSectionModule({
    super.key,
    required this.newsItems,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Center the column contents
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 100,),
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
                    SizedBox(width: 150,),
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
                    padding: EdgeInsets.all(16.0), // Add padding for better spacing around the text
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, Viverra nunc ante velit vitae.",
                      textAlign: TextAlign.center, // Center-align the text
                      style: TextStyle(
                        fontSize: 18.0, // Adjust font size according to your design
                        height: 1.5,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          ...newsItems, // Spread operator to add all news items
        ],
      ),
    );
  }
}
