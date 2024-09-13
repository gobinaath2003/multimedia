import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostTabBar(),
    );
  }
}

class PostTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Post Tabs'),
          backgroundColor: Colors.blue,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Text Post'),
              Tab(text: 'Image Post'),
              Tab(text: 'Video Post'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TextPostTab(),
            ImagePostTab(),
            VideoPostTab(),
          ],
        ),
      ),
    );
  }
}

class TextPostTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "📜 This is a sample text post. It showcases the text post feature of the app.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Share.share("📜 This is a sample text post. It showcases the text post feature of the app.");
            },
            child: Text('Share Text Post'),
          ),
        ],
      ),
    );
  }
}

class ImagePostTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/logo.png"), // Use a valid image URL
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Share.share("Check out this image!");
            },
            child: Text('Share Image Post'),
          ),
        ],
      ),
    );
  }
}

class VideoPostTab extends StatelessWidget {
  final String videoUrl = "https://youtu.be/dQw4w9WgXcQ"; // Replace with your video URL

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Watch this video:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              final uri = Uri.parse(videoUrl);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not launch $videoUrl')),
                );
              }
            },
            child: Text('Open Video'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Share.share("Check out this video: $videoUrl");
            },
            child: Text('Share Video Post'),
          ),
        ],
      ),
    );
  }
}
