import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind/components/users.dart';
import 'package:mind/screen/auth/loginpage.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "MINDFULNESS",
          style: GoogleFonts.poppins(
            fontSize: 32,
            color: const Color.fromARGB(255, 255, 20, 3),
          ),
        ),
        // actions: const [
        //   Icon(
        //     Icons.edit,
        //     color: Colors.white,
        //   ),
        // ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 75),
          Center(
            child: Text(
              "Who's Watching?",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Users(),
                        ));
                  },
                  child: _buildProfileAvatar("images/aa.jpeg", "User 1")),
              const SizedBox(width: 30),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Users(),
                        ));
                  },
                  child: _buildProfileAvatar("images/bb.png", "User 2")),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Users(),
                        ));
                  },
                  child: _buildProfileAvatar("images/cc.png", "User 3")),
              const SizedBox(width: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                child: _buildProfileAvatar("", "Add Profile "),
              ), // Placeholder for icon only
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(String imagePath, String userName) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center, // Center the icon
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Rounded corners
              child: Container(
                height: 150,
                width: 130,
                color: Colors
                    .grey[800], // Placeholder color in case of a loading image
                child: imagePath.isNotEmpty
                    ? Image.asset(
                        imagePath,
                        fit: BoxFit.cover, // Fit the image inside the container
                      )
                    : null, // No image
              ),
            ),
            if (imagePath.isEmpty) // Show icon if no image is provided
              const Icon(
                Icons.add,
                color: Colors.white,
                size: 50, // Size of the icon
              ),
          ],
        ),
        const SizedBox(height: 8), // Spacing between image and text
        Row(
          children: [
            const Icon(Icons.person, color: Colors.white), // Add icon
            const SizedBox(width: 4), // Spacing between icon and text
            Text(
              userName,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
