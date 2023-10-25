import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String imagePath;
  final String newsTitle;
  final String detailsNews;

  const DetailsPage({
    super.key,
    required this.imagePath,
    required this.newsTitle,
    required this.detailsNews,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.network(
                imagePath,
              ),
              const SizedBox(height: 20),
              Text(
                newsTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(detailsNews),
            ],
          ),
        ),
      ),
    );
  }
}
