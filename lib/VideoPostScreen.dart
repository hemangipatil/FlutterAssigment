import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';

class VideoPostScreen extends StatefulWidget {
  @override
  _VideoPostScreenState createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
  // List of video URLs, descriptions, and shareable post URLs
  final List<Map<String, String>> posts = [
    {
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
      "description": "Amazing Nature Video",
      "postUrl": "https://yourwebsite.com/video-post-1"
    },
    {
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "description": "City Time-lapse Video",
      "postUrl": "https://yourwebsite.com/video-post-2"
    },
    {
      "videoUrl": "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "description": "Relaxing Ocean Waves",
      "postUrl": "https://yourwebsite.com/video-post-3"
    },
  ];

  // Create a list to hold video player controllers for each post
  late List<VideoPlayerController> _controllers;

  @override
  void initState() {
    super.initState();

    // Initialize video player controllers for each video
    _controllers = posts
        .map((post) => VideoPlayerController.network(post["videoUrl"]!)
      ..initialize().then((_) {
        setState(() {}); // Update the state once video is loaded
      }))
        .toList();
  }

  @override
  void dispose() {
    // Dispose of the video controllers when not needed
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // Function to share the post
  void _sharePost(String postUrl) {
    Share.share('Check out this video post: $postUrl');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Posts'),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          var controller = _controllers[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Displaying the video player
                  controller.value.isInitialized
                      ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                      : Container(
                    height: 200,
                    color: Colors.black,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    posts[index]["description"]!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      // Play/Pause button
                      IconButton(
                        icon: Icon(
                          controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: () {
                          setState(() {
                            controller.value.isPlaying
                                ? controller.pause()
                                : controller.play();
                          });
                        },
                      ),
                      Spacer(),
                      // Share button
                      ElevatedButton(
                        onPressed: () => _sharePost(posts[index]["postUrl"]!),
                        child: Text('Share Video Post'),
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
