import 'package:get/get.dart';

import 'community_page.dart';

class ArticleController extends GetxController {
  var articleList = [
    Article(
      date: 'April 17, 2023',
      genre: 'News',
      title: 'Article 1',
      author: 'Author 1',
      content: 'This is the content of article 1.',
    ),
    Article(
      date: 'April 16, 2023',
      genre: 'Meeting',
      title: 'Article 2',
      author: 'Author 2',
      content: 'This is the content of article 2.',
    ),
    // Add more articles as needed
  ].obs;

  void addArticle(Article article) {
    articleList.add(article);
    articleList.refresh(); // Notify listeners of the change
  }
}
