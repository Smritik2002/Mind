import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/drawerpage.dart';
import 'package:mind/components/searchpage.dart';
import 'package:mind/components/yogapage.dart';
import 'package:mind/screen/auth/userpage.dart';
import 'package:mind/screen/homepage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  int _currentIndex = 2;

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
        backgroundColor: Colors.black,
        title: Text(
          "Mindfulness",
          style: GoogleFonts.poppins(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  ));
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Drawerpage()));
            },
          ),
        ],
      ),
      drawer: const Drawerpage(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            _buildProfileSection(),
            const SizedBox(height: 20),
            _buildDownloadsSection(),
            const SizedBox(height: 20),
            _buildMyListSection(), // Add the new section here
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

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('images/aa.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Userpage(),
                    ));
              },
              child: const Icon(Icons.arrow_drop_down, color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildDownloadsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.download, color: Colors.blue.shade300, size: 30),
              const SizedBox(width: 10),
              Text(
                'Downloads',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildDownloadItems(),
        ],
      ),
    );
  }

  Widget _buildMyListSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.list, color: Colors.blue.shade300, size: 30),
              const SizedBox(width: 10),
              Text(
                'My List',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _buildMyListItems(),
        ],
      ),
    );
  }

  Widget _buildDownloadItem(String title, String subtitle, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 140,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: Colors.grey.shade400,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadItems() {
    return SizedBox(
      height: 190, // Fixed height for download items
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Yogapage(),
                    ));
              },
              child: _buildDownloadItem(
                  'Alchemy of Souls', 'Subtitle 1', 'images/v.jpeg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Yogapage(),
                    ));
              },
              child: _buildDownloadItem(
                  'Alchemy of Souls', 'Subtitle 1', 'images/e.jpeg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Yogapage(),
                    ));
              },
              child: _buildDownloadItem(
                  'Alchemy of Souls', 'Subtitle 1', 'images/v.jpeg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Yogapage(),
                    ));
              },
              child: _buildDownloadItem(
                  'Alchemy of Souls', 'Subtitle 1', 'images/w.jpg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Yogapage(),
                    ));
              },
              child: _buildDownloadItem(
                  'Alchemy of Souls', 'Subtitle 1', 'images/e.jpeg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Yogapage(),
                    ));
              },
              child: _buildDownloadItem(
                  'Alchemy of Souls', 'Subtitle 1', 'images/w.jpg')),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Yogapage(),
                    ));
              },
              child: _buildDownloadItem(
                  'Alchemy of Souls', 'Subtitle 1', 'images/v.jpeg')),
        ],
      ),
    );
  }

  Widget _buildMyListItems() {
    return SizedBox(
      height: 190, // Fixed height for My List items
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Yogapage(),
                ),
              );
            },
            child: _buildDownloadItem(
              'Alchemy of Souls',
              'Subtitle A',
              'images/v.jpeg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Yogapage(),
                ),
              );
            },
            child: _buildDownloadItem(
              'Alchemy of Souls',
              'Subtitle B',
              'images/e.jpeg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Yogapage(),
                ),
              );
            },
            child: _buildDownloadItem(
              'Alchemy of Souls',
              'Subtitle C',
              'images/w.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Yogapage(),
                ),
              );
            },
            child: _buildDownloadItem(
              'Alchemy of Souls',
              'Subtitle D',
              'images/w.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Yogapage(),
                ),
              );
            },
            child: _buildDownloadItem(
              'Alchemy of Souls',
              'Subtitle E',
              'images/w.jpg',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Yogapage(),
                ),
              );
            },
            child: _buildDownloadItem(
              'Alchemy of Souls',
              'Subtitle F',
              'images/w.jpg',
            ),
          ),
        ],
      ),
    );
  }
}
