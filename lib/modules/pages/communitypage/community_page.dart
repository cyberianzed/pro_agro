import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/color_constants.dart';
import 'article_controller.dart';

class CommunityPage extends StatelessWidget {
  final articleController = Get.put(ArticleController());
  CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Community Joined : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  'Choondacherry',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                      color: ColorConstants.green),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Member for 2 years', // Replace with actual value
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: articleController.articleList.length,
                itemBuilder: (context, index) {
                  final article = articleController.articleList[index];
                  return ArticleCard(article: article);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showAddArticleBottomSheet(context);
        },
        label: const Text('New Article'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.bolt,
                    color: Colors.redAccent,
                    size: 17,
                  ),
                  Text(
                    article.genre,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const Text('  | '),
                  Text(
                    article.date,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                article.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                article.content,
                style: const TextStyle(
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.author,
                    style: const TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // Handle bookmark action
                        },
                        icon: const Icon(Icons.bookmark),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle share action
                        },
                        icon: const Icon(Icons.share),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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

void _showAddArticleBottomSheet(BuildContext context) {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final contentController = TextEditingController();
  final genreController = TextEditingController();
  final dateController = TextEditingController();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add New Article',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: authorController,
                decoration: const InputDecoration(
                  labelText: 'Author',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: 'Content',
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: genreController,
                decoration: const InputDecoration(
                  labelText: 'Genre',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Retrieve the entered values
                  final title = titleController.text;
                  final author = authorController.text;
                  final content = contentController.text;
                  final genre = genreController.text;
                  final date = dateController.text;

                  // Create a new article object
                  final newArticle = Article(
                    title: title,
                    author: author,
                    content: content,
                    genre: genre,
                    date: date,
                  );

                  // Access the ArticleController and add the new article
                  final articleController = Get.find<ArticleController>();
                  articleController.addArticle(newArticle);

                  // Close the bottom sheet
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
