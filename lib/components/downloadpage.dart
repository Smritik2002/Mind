import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind/components/bottomnavigation.dart';
import 'package:mind/components/downloadmanager.dart';
import 'package:mind/screen/homepage.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  int _currentIndex = 1; // Manage the current index of the BottomNavigationBar

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Add navigation logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    final downloadedVideos = DownloadManager.getDownloadedVideos();

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
        ), // Set background color to match your theme
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Add search functionality if needed
            },
          ),
        ],
      ),
      body: downloadedVideos.isEmpty
          ? const Center(
              child: Text("No downloads available."),
            )
          : ListView.builder(
              itemCount: downloadedVideos.length,
              itemBuilder: (context, index) {
                final video = downloadedVideos[index];
                return ListTile(
                  leading:
                      video['imageUrl'] != null && video['imageUrl']!.isNotEmpty
                          ? Image.network(video['imageUrl']!)
                          : const Icon(Icons.image_not_supported),
                  title: Text(video['title'] ?? 'No Title'),
                  subtitle: Text(video['description'] ?? 'No Description'),
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
