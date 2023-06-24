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
        date: 'April 17, 2023',
        genre: 'Farming',
        title: 'Sustainable Practices for Rice Cultivation in Kerala',
        author: 'Rebecca Thomas',
        content:
            'Rice cultivation plays a vital role in Kerala\'s agricultural landscape. Adopting sustainable practices can enhance productivity and ensure environmental conservation. One such practice is System of Rice Intensification (SRI), which focuses on optimizing seedlings, water management, and organic inputs. Implementing SRI has shown significant increases in rice yield, reduced water usage, and minimized greenhouse gas emissions. Additionally, integrated pest management and organic fertilizers promote natural pest control and maintain soil fertility. By embracing sustainable rice cultivation practices, Kerala farmers can achieve long-term agricultural sustainability and contribute to a greener future.',
        isBookmarked: false,
        description:
            'Explore sustainable practices for rice cultivation in Kerala.',
      ),
      Article(
        date: 'April 16, 2023',
        genre: 'Farming',
        title: 'Revitalizing Traditional Farming Methods in Kerala',
        author: 'Anoop Menon',
        content:
            'Kerala has a rich heritage of traditional farming methods that have sustained communities for centuries. It is crucial to preserve and revitalize these practices to ensure sustainable agriculture. Farmers can leverage indigenous knowledge by incorporating techniques such as mixed cropping, organic manure, and natural pest repellents. Additionally, promoting agroforestry systems that integrate trees with crop cultivation enhances biodiversity and provides ecological benefits. Revitalizing traditional farming methods not only preserves cultural heritage but also promotes self-sufficiency, biodiversity conservation, and resilience in the face of climate change.',
        isBookmarked: false,
        description:
            'Discover the importance of revitalizing traditional farming methods in Kerala.',
      ),
      Article(
        date: 'April 15, 2023',
        genre: 'Farming',
        title: 'Exploring Organic Pest Control Solutions for Kerala Farms',
        author: 'Maya Krishnan',
        content:
            'Pests pose a constant challenge for farmers in Kerala. Embracing organic pest control solutions offers effective and eco-friendly alternatives to synthetic pesticides. Integrated pest management techniques, such as biological control, trap crops, and pheromone traps, help maintain pest populations at manageable levels. Beneficial insects like ladybugs and parasitic wasps can be introduced to control pests naturally. Additionally, cultural practices like crop rotation, intercropping, and maintaining proper plant hygiene contribute to pest prevention. By adopting organic pest control solutions, Kerala farmers can protect their crops, safeguard the environment, and ensure safer food production.',
        isBookmarked: false,
        description:
            'Learn about organic pest control solutions for farms in Kerala.',
      ),
      Article(
        date: 'April 14, 2023',
        genre: 'Farming',
        title: 'Maximizing Banana Plantations in Kerala: Tips and Techniques',
        author: 'Rajesh Nair',
        content:
            'Banana cultivation thrives in Keralas tropical climate and holds significant economic potential. To maximize banana plantations, farmers should focus on proper land preparation, selecting suitable banana varieties, and implementing efficient irrigation systems. Providing adequate organic fertilizers, managing pests and diseases, and adopting good agricultural practices contribute to optimal growth and yield. Additionally, post-harvest techniques like proper storage, packaging, and marketing strategies help preserve quality and fetch better prices. By adopting scientific techniques and staying updated with market trends, Kerala farmers can unlock the full potential of banana cultivation and enhance profitability.',
        isBookmarked: false,
        description:
            'Discover tips and techniques for maximizing banana plantations in Kerala.',
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
        description:
            'Explore the potential of dairy farming for sustainable livelihoods in Kerala.',
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
  String description;

  Article({
    required this.date,
    required this.genre,
    required this.title,
    required this.author,
    required this.content,
    bool isBookmarked = false,
    required this.description,
  }) : isBookmarked = isBookmarked.obs;
}
