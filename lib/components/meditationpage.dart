import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind/screen/homepage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/searchpage.dart';

class Meditationpage extends StatefulWidget {
  const Meditationpage({super.key});

  @override
  State<Meditationpage> createState() => _SleepstoriespageState();
}

class _SleepstoriespageState extends State<Meditationpage> {
  late YoutubePlayerController _controller;
  int _currentVideoIndex = 0;

  final List<Map<String, String>> videos = [
    {
      "title": "Guided Meditation for Deep Relaxation",
      "url": "https://www.youtube.com/watch?v=M0u9GST_j3s",
      "description":
          "Experience deep relaxation and stress relief with this guided meditation. Perfect for unwinding after a long day.",
      "imageUrl": "https://img.youtube.com/vi/M0u9GST_j3s/hqdefault.jpg",
    },
    {
      "title": "Mindfulness Meditation - Be Present",
      "url": "https://www.youtube.com/watch?v=inpok4MKVLM",
      "description":
          "This guided mindfulness meditation helps you to stay present, calm your mind, and improve focus.",
      "imageUrl": "https://img.youtube.com/vi/inpok4MKVLM/hqdefault.jpg",
    },
    {
      "title": "Meditation for Anxiety - Calm Your Mind",
      "url": "https://www.youtube.com/watch?v=MIr3RsUWrdo",
      "description":
          "Reduce anxiety and promote calm with this soothing guided meditation, designed to ease your mind.",
      "imageUrl": "https://img.youtube.com/vi/MIr3RsUWrdo/hqdefault.jpg",
    },
    {
      "title": "Guided Meditation for Deep Relaxation",
      "url": "https://www.youtube.com/watch?v=M0u9GST_j3s",
      "description":
          "Experience deep relaxation and stress relief with this guided meditation. Perfect for unwinding after a long day.",
      "imageUrl": "https://img.youtube.com/vi/M0u9GST_j3s/hqdefault.jpg",
    },
    {
      "title": "Evening Meditation for Gratitude",
      "url": "https://www.youtube.com/watch?v=WYP_W49o1vQ",
      "description":
          "Reflect on the day with gratitude and positivity with this calming evening meditation.",
      "imageUrl": "https://img.youtube.com/vi/WYP_W49o1vQ/hqdefault.jpg",
    },
    {
      "title": "Guided Meditation for Sleep",
      "url": "https://www.youtube.com/watch?v=ZToicYcHIOU",
      "description":
          "Drift into a peaceful sleep with this soothing guided meditation for rest and relaxation.",
      "imageUrl": "https://img.youtube.com/vi/ZToicYcHIOU/hqdefault.jpg",
    },
    {
      "title": "Body Scan Meditation for Relaxation",
      "url": "https://www.youtube.com/watch?v=O-6f5wQXSu8",
      "description":
          "Relieve tension and relax with this guided body scan meditation, focusing on each part of your body.",
      "imageUrl": "https://img.youtube.com/vi/O-6f5wQXSu8/hqdefault.jpg",
    },
    {
      "title": "Guided Meditation for Deep Relaxation",
      "url": "https://www.youtube.com/watch?v=M0u9GST_j3s",
      "description":
          "Experience deep relaxation and stress relief with this guided meditation. Perfect for unwinding after a long day.",
      "imageUrl": "https://img.youtube.com/vi/M0u9GST_j3s/hqdefault.jpg",
    },
    {
      "title": "Guided Meditation for Deep Relaxation",
      "url": "https://www.youtube.com/watch?v=M0u9GST_j3s",
      "description":
          "Experience deep relaxation and stress relief with this guided meditation. Perfect for unwinding after a long day.",
      "imageUrl": "https://img.youtube.com/vi/M0u9GST_j3s/hqdefault.jpg",
    },
    {
      "title": "Body Scan Meditation for Relaxation",
      "url": "https://www.youtube.com/watch?v=O-6f5wQXSu8",
      "description":
          "Relieve tension and relax with this guided body scan meditation, focusing on each part of your body.",
      "imageUrl": "https://img.youtube.com/vi/O-6f5wQXSu8/hqdefault.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    final videoId =
        YoutubePlayer.convertUrlToId(videos[_currentVideoIndex]['url'] ?? '');
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );

      _controller.addListener(() {
        if (_controller.value.isFullScreen) {
          SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft],
          );
        } else {
          SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp],
          );
        }
      });
    } else {
      print("Error: Invalid video ID.");
    }
  }

  void _changeVideo(int index) {
    setState(() {
      _currentVideoIndex = index;
      final videoId =
          YoutubePlayer.convertUrlToId(videos[_currentVideoIndex]['url'] ?? '');
      if (videoId != null) {
        _controller.load(videoId);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _currentIndex = 0;

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Add navigation or functionality based on the tapped index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchPage(),
                ),
              );
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarPage(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onBottomNavBarTap,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              onReady: () {
                _controller.addListener(() {
                  if (_controller.value.isFullScreen) {
                    SystemChrome.setPreferredOrientations(
                      [
                        DeviceOrientation.landscapeRight,
                        DeviceOrientation.landscapeLeft
                      ],
                    );
                  } else {
                    SystemChrome.setPreferredOrientations(
                      [DeviceOrientation.portraitUp],
                    );
                  }
                });
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  videos[_currentVideoIndex]['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "2024   •  Sleep Story  •  HD",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                    ),
                  ),
                ),
                Text(
                  videos[_currentVideoIndex]['description']!,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _controller.play();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.play_arrow, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'Play Video',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    _controller.play();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.download, color: Colors.black),
                      SizedBox(width: 8),
                      Text(
                        'Download',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.add, color: Colors.white),
                          SizedBox(height: 4),
                          Text("My List",
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Icon(Icons.thumb_up, color: Colors.white),
                          SizedBox(height: 4),
                          Text("Rate", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Icon(Icons.share, color: Colors.white),
                          SizedBox(height: 4),
                          Text("Share", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Recommended Videos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = videos[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    child: Image.network(
                      video['imageUrl']!,
                      width: 100,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    video['title']!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Text(
                          video['description']!,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.7)),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.download, color: Colors.white),
                        onPressed: () {
                          // Handle download action here
                          print("Download ${video['title']}");
                        },
                      ),
                    ],
                  ),
                  onTap: () => _changeVideo(index),
                );
              },
              childCount: videos.length,
            ),
          ),
        ],
      ),
    );
  }
}
