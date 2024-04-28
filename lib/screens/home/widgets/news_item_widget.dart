import 'package:flutter/material.dart';

// This widget represents an individual news item
class NewsItem extends StatelessWidget {
  final String name; // News source name
  final String description; // Description of the news source
  final String url; // URL of the news source
  final String imageUrl; // Image URL for the news source (to be determined)

  const NewsItem({
    super.key,
    required this.name,
    required this.description,
    required this.url,
    this.imageUrl = 'https://via.placeholder.com/150', // Default image if none provided
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10.0),
            ),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity, // Image takes the full width of the card
              height: 150, // Fixed height for the image
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name, // Use the name of the news source
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Text(
              description, // Description of the news source
              style: const TextStyle(fontSize: 14),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                // Add navigation or link to a web view with the full news URL
              },
              child: const Text(
                'Read more...',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
