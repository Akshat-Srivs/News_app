import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_reading_app/models/news_article.dart';

class NewsService {
  static const _apiKey = 'a9fa5a7dacd2425e86bc397b8d255f14';
  static const _baseUrl = 'https://newsapi.org/v2';

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    try {
      final response = await http
          .get(Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'))
          .timeout(const Duration(seconds: 10));

      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        print("API Response: $data"); // Log the whole response
        final articles = data['articles'] as List;

        return articles.map((article) {
          // Check if any fields are null before creating a NewsArticle
          print("Article Data: $article"); // Log individual article data
          return NewsArticle(
            source: article['source'] != null ? article['source']['name'] : 'Unknown',
            author: article['author'] ?? 'Unknown',
            title: article['title'] ?? 'No Title',
            description: article['description'] ?? 'No Description',
            url: article['url'] ?? '',
            urlToImage: article['urlToImage'] ?? '',
            publishedAt: article['publishedAt'] ?? '',
            content: article['content'] ?? '',
          );
        }).toList();
      } else {
        throw Exception('Failed to load news');
      }
    } catch (error) {
      throw Exception('Error fetching news: $error');
    }
  }
}
