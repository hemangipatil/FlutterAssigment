import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ImagePostScreen extends StatefulWidget {
  @override
  State<ImagePostScreen> createState() => _ImagePostScreenState();
}

class _ImagePostScreenState extends State<ImagePostScreen> {
  // List of image URLs, descriptions, and shareable post URLs
  final List<Map<String, String>> posts = [
    {
      "imageUrl": "https://hips.hearstapps.com/hmg-prod/images/beautiful-landscape-view-of-fuji-mountain-in-royalty-free-image-1623253648.jpg",
      "description": "Beautiful Mountain View",
      "postUrl": "https://yourwebsite.com/image-post-1"
    },
    {
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNQSnfYSGxr5qgs1MW_HZ5feoWUMJ4Rg0_YA&s",
      "description": "Serene Beach Scene",
      "postUrl": "https://yourwebsite.com/image-post-2"
    },
    {
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXrWsvLjzaTM8TxPXzfoGphAIs8TVOvQ5Ijw&s",
      "description": "Sunset Over the Hills",
      "postUrl": "https://yourwebsite.com/image-post-3"
    },
  ];

  // Function to share a post
  void _sharePost(String postUrl) {
    Share.share('Check out this image post: $postUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Posts'),
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
                  // Displaying the actual image
                  Image.network(
                    posts[index]["imageUrl"]!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    posts[index]["description"]!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _sharePost(posts[index]["postUrl"]!),
                    child: Text('Share Image Post'),
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
