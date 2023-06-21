import 'package:get/get.dart';
import 'community_page.dart';

class ArticleController extends GetxController {
  final articleList = <Article>[].obs;

  void onInit() {
    super.onInit();
    fetchArticleData();
  }

  void fetchArticleData() {
    final articleData = [
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
    ];
    articleList.value = articleData;
  }

  void addArticle(Article article) {
    articleList.add(article);
    articleList.refresh(); // Notify listeners of the change
  }
}

class Article {
  final String date;
  final String genre;
  final String title;
  final String author;
  final String content;

  Article({
    required this.date,
    required this.genre,
    required this.title,
    required this.author,
    required this.content,
  });
}
