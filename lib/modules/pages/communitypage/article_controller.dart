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
        title: 'New Study Reveals Benefits of Organic Farming',
        author: 'John Smith',
        content:
            'A new study conducted by the Agricultural Research Institute shows that organic farming practices result in higher crop yields and improved soil health. Farmers are encouraged to adopt sustainable farming methods for long-term benefits.',
      ),
      Article(
        date: 'April 16, 2023',
        genre: 'Meeting',
        title: 'Upcoming Agriculture Conference in Your Area',
        author: 'Emma Johnson',
        content:
            'Attention all farmers and agricultural enthusiasts! Don\'t miss the upcoming Agriculture Conference happening on May 5th. The event will feature expert speakers, workshops, and networking opportunities. Register now to secure your spot.',
      ),
      Article(
        date: 'April 15, 2023',
        genre: 'Farming',
        title: 'Tips for Successful Crop Rotation',
        author: 'Michael Anderson',
        content:
            'Crop rotation is a crucial practice in sustainable farming. By rotating crops, farmers can prevent soil depletion, control pests and diseases, and improve overall crop productivity. This article provides useful tips and guidelines for implementing effective crop rotation techniques.',
      ),
      Article(
        date: 'April 14, 2023',
        genre: 'News',
        title: 'New Technology Revolutionizing Agriculture',
        author: 'Sarah Thompson',
        content:
            'The advent of precision agriculture and smart farming technologies is transforming the agricultural industry. From drones and sensors to data analytics and automation, these innovations are enabling farmers to optimize resources, improve efficiency, and increase yields. Stay updated on the latest advancements in agricultural technology.',
      ),
    ];
    // Add more articles as needed
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
