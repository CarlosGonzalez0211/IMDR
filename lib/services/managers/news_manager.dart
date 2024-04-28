import 'dart:async';
import 'package:flutter/material.dart';
import '../../screens/home/widgets/news_item_widget.dart';
import '../news_service.dart';

class NewsManager with ChangeNotifier {
  final NewsService _newsService = NewsService();
  final StreamController<List<NewsItem>> _newsController = StreamController();

  Stream<List<NewsItem>> get newsStream => _newsController.stream;

  NewsManager() {
    _startStream();
  }

  void _startStream() async {
    try {
      final newsData = await _newsService.fetchHealthNews();
      final newsItems = (newsData['articles'] as List?)
          ?.map((news) => NewsItem(
        name: news['title'],
        description: news['description'],
        url: news['url'],
        imageUrl: news['urlToImage'] ?? 'https://via.placeholder.com/150',
      ))
          .toList();
      if (newsItems != null) {
        _newsController.add(newsItems);
      } else {
        _newsController.add([]); // or you can add an empty list
      }
    } catch (e) {
      print('Error fetching news: $e');
      // You can also show an error message to the user here
    }
  }

  void disposeStream() {
    _newsController.close();
  }
}