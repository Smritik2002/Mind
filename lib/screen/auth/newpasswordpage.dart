import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mind/screen/auth/loginpage.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'New Password',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create a new password',
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'New Password',
                labelStyle: GoogleFonts.poppins(
                  color: Colors.white54,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[900],
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              cursorColor: Colors.red.shade800,
              obscureText: true,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            const SizedBox(
              height: 18,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: GoogleFonts.poppins(
                  color: Colors.white54,
                  fontSize: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[900],
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red.shade800,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              obscureText: true,
              cursorColor: Colors.red.shade800,
              style: GoogleFonts.poppins(color: Colors.white),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor:
                      const Color.fromARGB(255, 250, 20, 3), // Button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: Text(
                  'Create Password',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
