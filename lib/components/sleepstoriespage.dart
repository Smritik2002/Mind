import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mind/screen/homepage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/searchpage.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:mind/components/downloadmanager.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Sleepstoriespage extends StatefulWidget {
  const Sleepstoriespage({super.key});

  @override
  State<Sleepstoriespage> createState() => _SleepstoriespageState();
}

class _SleepstoriespageState extends State<Sleepstoriespage> {
  late YoutubePlayerController _controller;
  ValueNotifier downloadProgressNotifier = ValueNotifier(0.0);
  int _currentVideoIndex = 0;
  bool _isYoutubePlayerVisible = true;

  final List<Map<String, String>> videos = [
    {
      "title": "The Whispering Forest",
      "url": "https://www.youtube.com/watch?v=qRh6O0VS7AQ",
      "description":
          "Immerse yourself in the gentle whispers of the forest as you drift into a peaceful slumber.",
      "imageUrl": "https://img.youtube.com/vi/qRh6O0VS7AQ/hqdefault.jpg",
    },
    {
      "title": "Ocean Waves",
      "url": "https://youtu.be/1ZYbU82GVz4",
      "description":
          "Relax to the sound of ocean waves lapping at the shore, guiding you to restful sleep.",
      "imageUrl": "https://img.youtube.com/vi/1ZYbU82GVz4/hqdefault.jpg",
    },
    {
      "title": "Rainy Night in the Cabin",
      "url": "https://youtu.be/ynLpZGegiJE",
      "description":
          "Listen to the soothing rain as it taps against the cabin roof, calming your mind and easing you into sleep.",
      "imageUrl": "https://img.youtube.com/vi/ynLpZGegiJE/hqdefault.jpg",
    },
    {
      "title": "Forest Rain Sounds",
      "url": "https://youtu.be/WFaOQcnH5ZI",
      "description":
          "Enjoy the calming sounds of rain falling in a dense forest, perfect for relaxation and sleep.",
      "imageUrl": "https://img.youtube.com/vi/WFaOQcnH5ZI/hqdefault.jpg",
    },
    {
      "title": "Gentle River Stream",
      "url": "https://youtu.be/IvjMgVS6kng",
      "description":
          "Let the soothing sound of a gentle river stream wash over you as you unwind and prepare for sleep.",
      "imageUrl": "https://img.youtube.com/vi/IvjMgVS6kng/hqdefault.jpg",
    },
    {
      "title": "Meditative Piano Music",
      "url": "https://youtu.be/9YnZ9ecY0b8",
      "description":
          "Relax to calming piano music that creates a serene atmosphere for meditation and sleep.",
      "imageUrl": "https://img.youtube.com/vi/9YnZ9ecY0b8/hqdefault.jpg",
    },
    {
      "title": "Mountain Stream",
      "url": "https://youtu.be/gCRNEJxDJKM",
      "description":
          "Relax by the sound of a mountain stream with gentle water flow, ideal for a restful night.",
      "imageUrl": "https://img.youtube.com/vi/gCRNEJxDJKM/hqdefault.jpg",
    },
    {
      "title": "Calm Fireplace Sounds",
      "url": "https://youtu.be/L_LUpnjgPso",
      "description":
          "Enjoy the cozy and soothing sounds of a crackling fireplace to help you relax and fall asleep.",
      "imageUrl": "https://img.youtube.com/vi/L_LUpnjgPso/hqdefault.jpg",
    },
    {
      "title": "Ocean Breeze",
      "url": "https://youtu.be/G52dUQLxPzg",
      "description":
          "Feel the calmness of the ocean breeze as you listen to relaxing ocean sounds for a good night's sleep.",
      "imageUrl": "https://img.youtube.com/vi/G52dUQLxPzg/hqdefault.jpg",
    },
    {
      "title": "Soothing Wind Chimes",
      "url": "https://youtu.be/wKvjW_dhj2U",
      "description":
          "Drift away to the gentle and calming sounds of wind chimes in a serene setting.",
      "imageUrl": "https://img.youtube.com/vi/wKvjW_dhj2U/hqdefault.jpg",
    },
    {
      "title": "Serene Lake View",
      "url": "https://youtu.be/Se5NjX-cM5I",
      "description":
          "Immerse yourself in the tranquil ambiance of a serene lake with soothing natural sounds.",
      "imageUrl": "https://img.youtube.com/vi/Se5NjX-cM5I/hqdefault.jpg",
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
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid Video ID')),
        );
      }
    }
  }

  Future<void> _downloadVideo(Map<String, String> video) async {
    final yt = YoutubeExplode();
    try {
      final videoId = YoutubePlayer.convertUrlToId(video['url'] ?? '');
      if (videoId == null) throw Exception('Invalid YouTube URL');

      final manifest = await yt.videos.streamsClient.getManifest(videoId);
      final streams = manifest.muxed.sortByVideoQuality();

      if (streams.isEmpty) throw Exception('No streams found');

      if (!mounted) return;

      final selectedQuality = await showDialog<VideoQuality>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Download Quality'),
            children: streams.map((stream) {
              return SimpleDialogOption(
                onPressed: () => Navigator.pop(context, stream.videoQuality),
                child: Text(
                    '${stream.videoQuality.name} - ${stream.size.totalMegaBytes.toStringAsFixed(2)} MB'),
              );
            }).toList(),
          );
        },
      );

      if (selectedQuality == null) return;

      final streamInfo =
          streams.firstWhere((s) => s.videoQuality == selectedQuality);
      final stream = yt.videos.streams.get(streamInfo);

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/${video['title']}.mp4');

      var totalBytes = streamInfo.size.totalBytes;
      var receivedBytes = 0;

      if (!mounted) return;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ValueListenableBuilder(
            valueListenable: downloadProgressNotifier,
            builder: (context, value, snapshot) {
              return AlertDialog(
                title: const Text('Downloading'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LinearProgressIndicator(
                        value: downloadProgressNotifier.value),
                    const SizedBox(height: 10),
                    Text(
                        '${(downloadProgressNotifier.value * 100).toStringAsFixed(2)}%'),
                  ],
                ),
              );
            },
          );
        },
      );

      final fileStream = file.openWrite();

      await for (final data in stream) {
        receivedBytes += data.length;
        fileStream.add(data);

        downloadProgressNotifier.value = receivedBytes / totalBytes;
      }

      await fileStream.flush();
      await fileStream.close();

      DownloadManager.addDownloadedVideo({
        'title': video['title'] ?? '',
        'description': video['description'] ?? '',
        'imageUrl': video['imageUrl'] ?? '',
        'filePath': file.path,
      });

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Downloaded: ${video['title']}')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Download failed: $e')),
        );
      }
    } finally {
      yt.close();
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
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          setState(() {
            _controller.pause();
            _isYoutubePlayerVisible = false;
          });
          return;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Homepage(),
                  ),
                  (route) => false);
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
              child: _isYoutubePlayerVisible
                  ? YoutubePlayer(
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
                    )
                  : const SizedBox(),
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
                    onPressed: () => _downloadVideo(videos[_currentVideoIndex]),
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
                            Text("Share",
                                style: TextStyle(color: Colors.white)),
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
                          onPressed: () => _downloadVideo(video),
                          icon: const Icon(Icons.download, color: Colors.white),
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
      ),
    );
  }
}
