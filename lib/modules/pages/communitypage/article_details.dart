import 'package:flutter/material.dart';
import 'article_controller.dart';

class ArticleDetailsPage extends StatelessWidget {
  final Article article;

  const ArticleDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
         title: Text(
          article.genre,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const SizedBox(height: 8.0),
            Text(
              article.date,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              article.content,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Author: ${article.author}',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
