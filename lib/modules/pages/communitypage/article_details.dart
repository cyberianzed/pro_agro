import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/getdialog.dart';
import '../homepage/app/features/product/views/screens/product_detail_screen.dart';
import 'article_controller.dart';

class ArticleDetailsPage extends StatelessWidget {
  final Article article;

  const ArticleDetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfff0f4f7),
        elevation: 0,
        leading: CustomBackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 85,
                      height: 15,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          article.genre,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Color.fromARGB(131, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text(
                        article.date,
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Color.fromARGB(144, 0, 0, 0),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        article.author,
                        style: const TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          article.isBookmarked
                              .toggle(); // Toggle the bookmark status
                        },
                        icon: Obx(
                          () => Icon(
                            Icons.bookmark,
                            color: article.isBookmarked.value
                                ? Colors.black
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  Text(
                    article.content,
                    style: const TextStyle(
                        fontSize: 16.5,
                        color: Color.fromARGB(255, 101, 93, 93),
                        height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Ask a Question',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Type your question here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          getDialog('Your Message has been sent');
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Color.fromARGB(141, 0, 0, 0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
