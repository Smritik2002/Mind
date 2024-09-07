import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind/components/profilepage.dart';

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for the scaffold
      appBar: AppBar(
        backgroundColor: Colors.black, // Black background for the AppBar
        elevation: 0,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Profilepage(),
                ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Profile Picture (Rectangle)
              Container(
                width: 70,
                height: 70, // Rectangle shape with custom dimensionswh
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), // Rounded corners

                  image: const DecorationImage(
                    image: AssetImage('images/aa.jpeg'),
                    fit: BoxFit.cover, // Ensure the image covers the container
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Name TextField
              _buildTextField(
                controller: _nameController,
                hintText: 'Enter your name',
                icon: Icons.person,
              ),
              const SizedBox(height: 20),
              // Email TextField
              _buildTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                icon: Icons.email,
              ),
              const SizedBox(height: 40),
              // Save Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profilepage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.white, // White background for the button
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.poppins(
                    color: Colors.black, // Black text color for contrast
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      style: GoogleFonts.poppins(color: Colors.white), // White text color
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black, // Black background for the text fields
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
