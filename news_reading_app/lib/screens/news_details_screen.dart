import 'package:flutter/material.dart';
import 'package:news_reading_app/models/news_article.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
            Image.network(
              article.urlToImage!,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/images/fallback.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                );
              },
              height: 200,
              fit: BoxFit.cover,
            )
          else
            Image.asset(
              'assets/images/fallback.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
          const SizedBox(height: 10),
          Text(article.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(article.description ?? 'No description available'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final Uri url = Uri.parse(article.url);
              print ('Checking url : $url');
              if (await canLaunchUrl(url)) {
                await launchUrl(url , mode: LaunchMode.externalApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const Text('Read Full Article'),
          ),
        ],
      ),
    );
  }
}
