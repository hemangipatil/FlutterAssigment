import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TextPostScreen extends StatefulWidget {
  @override
  State<TextPostScreen> createState() => _TextPostScreenState();
}

class _TextPostScreenState extends State<TextPostScreen> {
  // List of text posts with descriptions and shareable URLs
  final List<Map<String, String>> posts = [
    {
      "title": "Inspirational Quote",
      "description": "Believe in yourself and all that you are.",
      "postUrl": "https://yourwebsite.com/text-post-1"
    },
    {
      "title": "Motivational Message",
      "description": "The best way to get started is to quit talking and begin doing.",
      "postUrl": "https://yourwebsite.com/text-post-2"
    },
    {
      "title": "Life Tip",
      "description": "Don’t watch the clock; do what it does. Keep going.",
      "postUrl": "https://yourwebsite.com/text-post-3"
    },
  ];

  // Function to share a post
  void _sharePost(String postUrl) {
    Share.share('Check out this text post: $postUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    posts[index]["title"]!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    posts[index]["description"]!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => _sharePost(posts[index]["postUrl"]!),
                        child: Text('Share Text Post'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
