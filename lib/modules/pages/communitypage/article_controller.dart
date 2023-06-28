import 'package:get/get.dart';

class ArticleController extends GetxController {
  final articleList = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticleData();
  }

  void fetchArticleData() {
    final articleData = [
      Article(
        date: 'June 8',
        genre: 'Meeting',
        title: 'Gathering of Nutmeg Farmers',
        author: 'Rebecca Thomas',
        content:
            'Under the leadership of Santhom Farmers Producer Company of Pala Social Welfare Society, a gathering of nutmeg farmers and a training program for them was conducted at Pala. The gathering was addressed with various issues faced by nutmeg farmers including scientific nutmeg growing techniques, different nutmeg storage ideas, production possibilities of value added products of nutmeg and various methods of sale of these nutmeg products. This program was conducted at Agrima Market Hall, Pala under the guidence of Mr. Joseph Sebastian.',
        isBookmarked: false,
      ),
      Article(
        date: 'June 7',
        genre: 'Farming',
        title: 'Bud Of New Life',
        author: 'TJ Philip',
        content:
            'Bud of New Life is a program developed recently in the  World Environment Day celebration conducted on 5th June 2023. This program was conducted in coordination with Mar Sleeva Medicity, Pala. One child is born along with a tree. A program where one tree is gifted to the family of a newborn baby was initiated on World Environment Day. This program was officially inaugurated by Pala Diocese Bishop Mar Joseph Kalarangatt. Bud of New Life was blessed with the presence of the managing director of Mar Sleeva Medicity, Fr. Joseph Kaniyodickal. This program was commenced with the support of Agrima Central Nursery run by the Pala Social Welfare Society.   ',
        isBookmarked: false,
      ),
      Article(
        date: 'June 24, ',
        genre: 'Seminar',
        title: 'Seminar on Jack Fruit value addition By Dr. Shana Harshan',
        author: 'Rajesh Nair',
        content:
            'The seminar was an informative one with discussions on preparation on various food products from Jackfruit. The session concluded at 1.30 p.m. and it was followed by traditional cultural competitions. There was also a band display conducted by Mannackanadu Special School team.',
        isBookmarked: false,
      ),
      Article(
        date: 'April 15, 2023',
        genre: 'Farming',
        title: 'Exploring Organic Pest Control Solutions for Kerala Farms',
        author: 'Maya Krishnan',
        content:
            'Pests pose a constant challenge for farmers in Kerala. Embracing organic pest control solutions offers effective and eco-friendly alternatives to synthetic pesticides. Integrated pest management techniques, such as biological control, trap crops, and pheromone traps, help maintain pest populations at manageable levels. Beneficial insects like ladybugs and parasitic wasps can be introduced to control pests naturally. Additionally, cultural practices like crop rotation, intercropping, and maintaining proper plant hygiene contribute to pest prevention. By adopting organic pest control solutions, Kerala farmers can protect their crops, safeguard the environment, and ensure safer food production.',
        isBookmarked: false,
      ),
      Article(
        date: 'April 13, 2023',
        genre: 'Farming',
        title: 'Dairy Farming for Sustainable Livelihoods in Kerala',
        author: 'Deepa Suresh',
        content:
            'Dairy farming offers a lucrative opportunity for sustainable livelihoods in Kerala. Establishing well-managed dairy farms requires careful planning, breed selection, and optimal nutrition management for cows. Adequate housing, proper sanitation, and regular veterinary care ensure the well-being of the animals. Keralas abundant fodder resources enable sustainable feed production, description: '
            ' for dairy cattle. Implementing modern milking techniques, hygienic milk handling, and value addition through dairy products enhance profitability. By adopting sustainable dairy farming practices, Kerala farmers can create a reliable income source, contribute to the dairy industry, and meet the growing demand for quality milk and dairy products.',
        isBookmarked: false,
      ),
    ];
    articleList.value = articleData;
  }

  void addArticle(Article article) {
    articleList.add(article);
    articleList.refresh(); // Notify listeners of the change
  }

  void deleteArticle(Article article) {
    articleList.remove(article);
    articleList.refresh();
  }

  void updateArticle(Article article) {
    articleList.refresh(); // Notify listeners of the change
  }
}

class Article {
  String date;
  String genre;
  String title;
  String author;
  String content;
  RxBool isBookmarked;

  Article({
    required this.date,
    required this.genre,
    required this.title,
    required this.author,
    required this.content,
    bool isBookmarked = false,
  }) : isBookmarked = isBookmarked.obs;
}
