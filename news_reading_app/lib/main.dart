import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_reading_app/providers/news_provider.dart';
import 'package:news_reading_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        title: 'News Reader',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
