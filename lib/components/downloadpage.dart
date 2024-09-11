import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/downloadmanager.dart';
import 'package:mind/screen/homepage.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  int _currentIndex = 1;
  List<Map<String, String>> _downloadedVideos = [];

  @override
  void initState() {
    super.initState();
    _loadDownloadedVideos();
  }

  Future<void> _loadDownloadedVideos() async {
    final videos = await DownloadManager.getDownloadedVideos();
    setState(() {
      _downloadedVideos = videos;
    });
  }

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Add navigation logic here if needed
  }

  void _playVideo(String filePath) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => VideoPlayerScreen(filePath: filePath),
    ));
  }

  Future<void> _deleteVideo(int index) async {
    await DownloadManager.removeDownloadedVideo(index);
    final file = File(_downloadedVideos[index]['filePath']!);
    if (await file.exists()) {
      await file.delete();
    }
    await _loadDownloadedVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Downloads",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Homepage(),
                ));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Add search functionality if needed
            },
          ),
        ],
      ),
      body: _downloadedVideos.isEmpty
          ? const Center(
              child: Text("No downloads available."),
            )
          : ListView.builder(
              itemCount: _downloadedVideos.length,
              itemBuilder: (context, index) {
                final video = _downloadedVideos[index];
                return ListTile(
                  leading: video['imageUrl'] != null &&
                          video['imageUrl']!.isNotEmpty
                      ? Image.network(video['imageUrl']!)
                      : const Icon(Icons.image_not_supported),
                  title: Text(video['title'] ?? 'No Title'),
                  subtitle: Text(video['description'] ?? 'No Description'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _deleteVideo(index),
                  ),
                  onTap: () => _playVideo(video['filePath']!),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBarPage(
        currentIndex: _currentIndex,
        onTap: _onBottomNavBarTap,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String filePath;

  const VideoPlayerScreen({Key? key, required this.filePath}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.filePath))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}