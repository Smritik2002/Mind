import 'package:flutter/material.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/meditationpage.dart';
import 'package:mind/components/searchpage.dart';
import 'package:mind/components/sleepstoriespage.dart';
import 'package:mind/components/soundscapes.dart';
import 'package:mind/components/yogapage.dart'; // Make sure you have this file with BottomNavigationBarPage widget

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Map<String, String>> calmAudios = [
    {
      'image': 'images/1111.jpeg',
    },
    {
      'image': 'images/6666.jpeg',
    },
    {
      'image': 'images/ii.jpg',
    },
    {
      'image': 'images/gg.jpg',
    },
    {
      'image': 'images/hh.jpg',
    },
    {
      'image': 'images/eee.jpeg',
    },
  ];

  final List<Map<String, String>> meditationSessions = [
    {
      'image': 'images/k.jpg',
    },
    {
      'image': 'images/h.jpeg',
    },
    {
      'image': 'images/ii.jpg',
    },
    {
      'image': 'images/v.jpeg',
    },
    {
      'image': 'images/x.jpeg',
    },
    {
      'image': 'images/z.jpg',
    },
  ];

  final List<Map<String, String>> yogaVideos = [
    {
      'image': 'images/v.jpeg',
    },
    {
      'image': 'images/x.jpeg',
    },
    {
      'image': 'images/z.jpg',
    },
    {
      'image': 'images/gg.jpg',
    },
    {
      'image': 'images/i.jpeg',
    },
    {
      'image': 'images/k.jpg',
    },
  ];

  final List<Map<String, String>> sleepvideos = [
    {
      'image': 'images/k.jpg',
    },
    {
      'image': 'images/ii.jpg',
    },
    {
      'image': 'images/hh.jpg',
    },
    {
      'image': 'images/gg.jpg',
    },
    {
      'image': 'images/i.jpeg',
    },
    {
      'image': 'images/v.jpeg',
    },
  ];

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle download action
            },
          ),
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
                  ));
            },
          ),
          const SizedBox(
            width: 16,
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'images/M.png',
            height: 32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 32,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Sleepstoriespage(),
                            ));
                      },
                      child: _buildCategoryButton('Sleep Stories')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Yogapage(),
                            ));
                      },
                      child: _buildCategoryButton('Yoga')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Meditationpage(),
                            ));
                      },
                      child: _buildCategoryButton('Meditation')),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Soundscapes(),
                            ));
                      },
                      child: _buildCategoryButton('Soundscapes')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color.fromARGB(255, 92, 91, 91),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "images/eee.jpeg",
                      fit: BoxFit.cover,
                      height: 450,
                      width: 335,
                    ),
                  ),
                  const Positioned(
                    bottom: 60,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mindfulness and Nourishment',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Peacefulness',
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '•',
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Healing',
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '•',
                              style: TextStyle(color: Colors.white70),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Relaxation',
                              style: TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle play action
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const Meditationpage(),
                                    ));
                              },
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Play',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle add to list action
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'My List',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildSectionTitle('Calm Audios'),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Soundscapes(),
                      ));
                },
                child: _buildItemList(calmAudios)),
            _buildSectionTitle('Meditation Sessions'),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Meditationpage(),
                      ));
                },
                child: _buildItemList(meditationSessions)),
            _buildSectionTitle('Yoga Videos'),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Yogapage(),
                      ));
                },
                child: _buildItemList(yogaVideos)),
            _buildSectionTitle('Recommended For You'),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Sleepstoriespage(),
                      ));
                },
                child: _buildItemList(sleepvideos)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarPage(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onBottomNavBarTap,
      ),
    );
  }

  Widget _buildCategoryButton(String title) {
    return Container(
      height: 30,
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList(List<Map<String, String>> items) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item['image']!,
                    height: 170,
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                ),
                // const SizedBox(height: 8),
                // Text(
                //   item['title']!,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
