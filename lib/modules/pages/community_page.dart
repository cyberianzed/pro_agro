import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        toolbarHeight: 100,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                chatList[index].name[0].toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              chatList[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              chatList[index].lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chatList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final ChatGroup chatGroup;

  const ChatScreen(this.chatGroup, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              child: Text(
                chatGroup.name[0],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              chatGroup.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: chatGroup.messages.length,
        itemBuilder: (context, index) {
          final message = chatGroup.messages[index];
          if (message is ArticleMessage) {
            return ArticleTile(articleMessage: message);
          } else if (message is TextMessage) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(
                  message.text[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(message.text),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open article creation screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateArticleScreen(chatGroup: chatGroup),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChatGroup {
  final String name;
  final List<dynamic> messages;

  ChatGroup(this.name, this.messages);

  String get lastMessage {
    if (messages.isNotEmpty) {
      final lastMessage = messages.last;
      if (lastMessage is TextMessage) {
        return lastMessage.text;
      } else if (lastMessage is ArticleMessage) {
        return 'Article: ${lastMessage.title}';
      }
    }
    return 'No messages yet';
  }
}

class TextMessage {
  final String text;
  TextMessage(this.text);
}

class ArticleMessage {
  final String title;
  final String content;
  final String? imagePath;

  ArticleMessage(this.title, this.content, {this.imagePath});
}

class ArticleTile extends StatelessWidget {
  final ArticleMessage articleMessage;

  const ArticleTile({super.key, required this.articleMessage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(
          articleMessage.title[0].toUpperCase(),
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(articleMessage.title),
      subtitle: Text(articleMessage.content),
      trailing: articleMessage.imagePath != null
          ? Image.asset(
              articleMessage.imagePath!,
              width: 50.0,
              height: 50.0,
            )
          : null,
    );
  }
}

class CreateArticleScreen extends StatefulWidget {
  final ChatGroup chatGroup;

  const CreateArticleScreen({super.key, required this.chatGroup});

  @override
  _CreateArticleScreenState createState() => _CreateArticleScreenState();
}

class _CreateArticleScreenState extends State<CreateArticleScreen> {
  String _title = '';
  String _content = '';
  String? _imagePath;

  void _pickImage() async {
    // TODO: Implement image picking functionality
    // You can use plugins like `image_picker` or `multi_image_picker` to handle image picking
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Article'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              onChanged: (value) {
                setState(() {
                  _title = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
              maxLines: null,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                setState(() {
                  _content = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Upload Image'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Text(_imagePath ?? 'No image selected'),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add article message to chat group
                final articleMessage =
                    ArticleMessage(_title, _content, imagePath: _imagePath);
                widget.chatGroup.messages.add(articleMessage);

                // Return to chat screen
                Navigator.pop(context);
              },
              child: const Text('Post Article'),
            ),
          ],
        ),
      ),
    );
  }
}

List<ChatGroup> chatList = [
  ChatGroup(
    'Locality Chat 1',
    [
      TextMessage('Hello everyone!'),
      ArticleMessage('Sample Article', 'This is a sample article.'),
    ],
  ),
  ChatGroup(
    'Locality Chat 2',
    [
      TextMessage('Good morning, neighbors!'),
    ],
  ),
];
