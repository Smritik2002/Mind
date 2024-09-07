import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind/screen/homepage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/searchpage.dart';

class Yogapage extends StatefulWidget {
  const Yogapage({super.key});

  @override
  State<Yogapage> createState() => _YogapageState();
}

class _YogapageState extends State<Yogapage> {
  late YoutubePlayerController _controller;
  int _currentVideoIndex = 0;

  final List<Map<String, String>> videos = [
    {
      "title": "Morning Yoga Routine",
      "url": "https://youtu.be/hJbRpHZr_d0",
      "description":
          "Start your day with a refreshing yoga routine that energizes your body and mind.",
      "imageUrl": "https://img.youtube.com/vi/hJbRpHZr_d0/hqdefault.jpg",
    },
    {
      "title": "Relaxing Yoga for Stress Relief",
      "url": "https://youtu.be/WnSr8w4QEWo",
      "description":
          "Unwind and de-stress with this gentle yoga session designed to promote relaxation.",
      "imageUrl": "https://img.youtube.com/vi/WnSr8w4QEWo/hqdefault.jpg",
    },
    {
      "title": "Evening Yoga for Better Sleep",
      "url": "https://youtu.be/7Vqv5SmSKHY",
      "description":
          "Prepare for a restful night's sleep with this calming evening yoga practice.",
      "imageUrl": "https://img.youtube.com/vi/7Vqv5SmSKHY/hqdefault.jpg",
    },
    {
      "title": "Gentle Yoga for Beginners",
      "url": "https://youtu.be/inpok4MKVLM",
      "description":
          "A gentle introduction to yoga for those new to the practice.",
      "imageUrl": "https://img.youtube.com/vi/inpok4MKVLM/hqdefault.jpg",
    },
    {
      "title": "Yoga for Energy and Vitality",
      "url": "https://youtu.be/aIIEI33EUqI",
      "description":
          "Boost your energy levels with this invigorating yoga session.",
      "imageUrl": "https://img.youtube.com/vi/aIIEI33EUqI/hqdefault.jpg",
    },
    {
      "title": "Yoga for Deep Relaxation",
      "url": "https://youtu.be/SvPKFsCiMsw",
      "description":
          "Achieve deep relaxation and tranquility with this slow-paced yoga practice.",
      "imageUrl": "https://img.youtube.com/vi/SvPKFsCiMsw/hqdefault.jpg",
    },
    {
      "title": "Yoga for Balance and Stability",
      "url": "https://youtu.be/wRAtVLgj-wU",
      "description":
          "Improve your balance and stability with this yoga practice.",
      "imageUrl": "https://img.youtube.com/vi/wRAtVLgj-wU/hqdefault.jpg",
    },
    {
      "title": "Yoga for Mindfulness and Calm",
      "url": "https://youtu.be/A0pkEgZiRG4",
      "description":
          "Cultivate mindfulness and calm with this yoga session focused on inner peace.",
      "imageUrl": "https://img.youtube.com/vi/A0pkEgZiRG4/hqdefault.jpg",
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
      } else {
        print("Error: Invalid video ID.");
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
                // Rest of the UI...
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final video = videos[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
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
