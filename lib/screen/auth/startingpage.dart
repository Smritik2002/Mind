import 'package:flutter/material.dart';
import 'package:mind/screen/auth/userpage.dart'; // Import your LoginPage

class Startingpage extends StatefulWidget {
  const Startingpage({super.key});

  @override
  State<Startingpage> createState() => _StartingpageState();
}

class _StartingpageState extends State<Startingpage> {
  @override
  void initState() {
    super.initState();

    // Show the loader and navigate to LoginPage after a delay
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const Userpage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120, // Netflix-like image width
              height: 120, // Netflix-like image height
              decoration: const BoxDecoration(
                shape: BoxShape.circle, // Circular shape
                image: DecorationImage(
                  image: AssetImage("images/M.png"), // Your image path
                  fit: BoxFit.cover, // Cover the entire circular area
                ),
              ),
            ),
            const SizedBox(
              height: 20, // Adjust spacing
            ),
            const CircularProgressIndicator(
              color: Colors.red, // Netflix-like loading color
            ),
          ],
        ),
      ),
    );
  }
}
