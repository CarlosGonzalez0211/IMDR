import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String _apiBaseUrl = 'https://newsapi.org/v2/top-headlines';
  final String _apiKey = 'ee5eedce2a2f43cf9e5aa3e3601b22a8';

  Future<Map<String, dynamic>> fetchHealthNews() async {
    // Constructing the URL with query parameters for health news in the US
    final url = Uri.parse('$_apiBaseUrl?country=us&category=health&apiKey=$_apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON and print it.
      final jsonData = json.decode(response.body) as Map<String, dynamic>;

      return jsonData;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load health news articles');
    }
  }
}