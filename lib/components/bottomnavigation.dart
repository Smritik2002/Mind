import 'package:flutter/material.dart';
import 'package:mind/components/downloadpage.dart';
import 'package:mind/components/profilepage.dart';
import 'package:mind/screen/homepage.dart';

class BottomNavigationBarPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color backgroundColor;

  const BottomNavigationBarPage({
    required this.currentIndex,
    required this.onTap,
    required this.selectedItemColor,
    required this.unselectedItemColor,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: 'Downloads',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unselectedItemColor,
      backgroundColor: backgroundColor,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DownloadPage(),
              ),
            );
            break;
          case 2:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Profilepage(),
              ),
            );
            break;
        }
        onTap(
            index); // Calls the onTap callback function with the selected index
      },
    );
  }
}
