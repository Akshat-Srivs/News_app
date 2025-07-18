import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_reading_app/providers/news_provider.dart';
import 'package:news_reading_app/widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<void> _fetchNewsFuture;

  @override
  void initState() {
    super.initState();
    _fetchNewsFuture = Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  Future<void> _refreshNews() async {
    // Call fetchNews method from the provider to refresh data
    await Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Reader'),
      ),
      body: FutureBuilder(
        future: _fetchNewsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching news.'));
          }

          return Consumer<NewsProvider>(
            builder: (context, newsProvider, child) {
              final articles = newsProvider.newsArticles;

              return RefreshIndicator(
                onRefresh: _refreshNews,
                child: ListView.builder(
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return NewsCard(article: article);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
