import 'package:flutter/material.dart';
import 'package:mind/components/bottomnavigation.dart';

class Librarypage extends StatefulWidget {
  const Librarypage({super.key});

  @override
  State<Librarypage> createState() => _LibrarypageState();
}

class _LibrarypageState extends State<Librarypage> {
  int _currentIndex = 1;

  void _onBottomNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation here
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
              // Handle search action
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
      bottomNavigationBar: BottomNavigationBarPage(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
        onTap: _onBottomNavBarTap,
      ),
    );
  }
}
