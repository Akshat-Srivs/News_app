import 'package:flutter/material.dart';
import 'package:news_reading_app/models/news_article.dart';
import 'package:news_reading_app/screens/news_details_screen.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetailsScreen(article: article)),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(
              article.urlToImage!,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/fallback.jpg', // <-- your fallback image
                  height: 200,
                  fit: BoxFit.cover,
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  Text(article.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
