import 'package:flutter/material.dart';

class TikTokLoginScreen extends StatelessWidget {
  const TikTokLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // TikTok often uses a dark background
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Log in to TikTok',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Placeholder for TikTok logo (replace with actual image later)
              const Icon(
                Icons.tiktok, // Use a placeholder icon for now
                size: 80,
                color: Colors.white,
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Phone number, email or username',
                  filled: true,
                  fillColor: const Color.fromARGB(255, 5, 5, 5),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              // Add password field and login button similarly
            ],
          ),
        ),
      ),
    );
  }
}