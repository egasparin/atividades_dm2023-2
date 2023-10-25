import 'package:flutter/material.dart';

import 'details_page.dart';

class NewsCard extends StatelessWidget {
  final String newsTitle;
  final String imagePath;
  final String detailsNews;

  const NewsCard({
    super.key,
    required this.newsTitle,
    required this.imagePath,
    required this.detailsNews,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return DetailsPage(
                detailsNews: detailsNews,
                imagePath: imagePath,
                newsTitle: newsTitle,
              );
            },
          ));
        },
        child: SizedBox(
          width: 0.8 * MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            children: [
              Image.network(
                imagePath, // URL da imagem
                width: 100,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Wrap(children: [
                      Text(
                        newsTitle,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
