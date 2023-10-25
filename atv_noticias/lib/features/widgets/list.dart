import 'package:atv_noticias/features/widgets/card.dart';
import 'package:flutter/material.dart';

class MyCardList extends StatelessWidget {
  final List<NewsCard> listNews;

  const MyCardList({
    super.key,
    required this.listNews,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listNews.length,
      itemBuilder: (context, index) {
        return NewsCard(
          newsTitle: listNews[index].newsTitle,
          imagePath: listNews[index].imagePath,
          detailsNews: listNews[index].detailsNews,
        );
      },
    );
  }
}
