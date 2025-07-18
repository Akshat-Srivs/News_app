import 'package:flutter/material.dart';
import 'package:news_reading_app/models/news_article.dart';
import 'package:news_reading_app/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsArticle> _newsArticles = [];
  List<NewsArticle> get newsArticles => _newsArticles;

  Future<List<NewsArticle>> fetchNews() async {
    NewsService newsService = NewsService();
    _newsArticles = await newsService.fetchTopHeadlines();
    notifyListeners();
    return _newsArticles;
  }
}

