import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/meditationpage.dart';
import 'package:mind/components/sleepstoriespage.dart';
import 'package:mind/components/soundscapes.dart';
import 'package:mind/components/yogapage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final Map<String, String> _mindfulnessItemsWithImages = {
    'Guided Meditation': 'images/x.jpeg',
    'Mindfulness Yoga': 'images/gg.jpg',
    'Breathing Exercises': 'images/z.jpg',
    'Mindfulness Music': 'images/ii.jpg',
    'Relaxation Techniques': 'images/ee.jpg',
    'Stress Relief Tips': 'images/hh.jpg',
    'Mindfulness Challenges': 'images/f.jpeg',
    'Mindfulness Videos': 'images/h.jpeg',
    'Audio Tracks': 'images/k.jpg',
    'Mindfulness Tools': 'images/i.jpeg',
    'Community Features': 'images/l.jpeg',
  };

  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = _mindfulnessItemsWithImages.keys.toList();
    _searchController.addListener(_filterItems);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterItems);
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems = _mindfulnessItemsWithImages.keys
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
      // Add your navigation logic here
    });
  }

  void _navigateToPage(BuildContext context, String item) {
    if (item == 'Guided Meditation') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Meditationpage()));
    } else if (item == 'Mindfulness Yoga') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Yogapage()));
    } else if (item == 'Breathing Exercises') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Yogapage()));
    } else if (item == 'Mindfulness Music') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Sleepstoriespage()));
    } else if (item == 'Relaxation Techniques') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Yogapage()));
    } else if (item == 'Stress Relief Tips') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Soundscapes()));
    } else if (item == 'Mindfulness Challenges') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Meditationpage()));
    } else if (item == 'Mindfulness Videos') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Sleepstoriespage()));
    } else if (item == 'Audio Tracks') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Yogapage()));
    } else if (item == 'Mindfulness Tools') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Soundscapes()));
    } else if (item == 'Community Features') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Meditationpage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Arrow and Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Handle back button action
                    },
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey[700]!),
                      ),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search calmness, meditation, yoga...',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey[400],
                          ),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.white),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Horizontal List of Recommended Mobile Games
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Recommended Mobile Games',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 120, // Set a fixed height for the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _mindfulnessItemsWithImages.length,
                itemBuilder: (context, index) {
                  final item = _mindfulnessItemsWithImages.keys.toList()[index];
                  final imagePath = _mindfulnessItemsWithImages[item] ??
                      'images/placeholder.jpg'; // Fallback to placeholder image

                  return GestureDetector(
                    onTap: () => _navigateToPage(context, item),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Vertical List of Recommended TV Shows & Movies
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
              child: Text(
                'Recommended TV Shows & Movies',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length, // Use filtered items
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  final imagePath = _mindfulnessItemsWithImages[item] ??
                      'images/placeholder.jpg'; // Fallback to placeholder image

                  return GestureDetector(
                    onTap: () => _navigateToPage(context, item),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 12.0),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.play_circle_fill,
                            color: Colors.white,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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
