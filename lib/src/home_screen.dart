import 'package:flutter/material.dart';
import 'package:myapp/src/facebook_login_content.dart'
    show FacebookLoginContent;
import 'package:myapp/src/instagram_login_content.dart'
    show InstagramLoginContent;
import 'package:myapp/src/tiktok_login_content.dart' show TikTokLoginContent;
import 'package:myapp/src/twitter_login_content.dart' show TwitterLoginContent;
import 'package:myapp/src/whatsapp_login_content.dart'
    show WhatsAppLoginContent;

class HomeScreen extends StatelessWidget {
  // Changed to StatelessWidget
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple, // Set the background color to purple
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Instagram Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InstagramLoginContent(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Twitter Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TwitterLoginContent(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Facebook Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FacebookLoginContent(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('TikTok Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TikTokLoginContent(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('WhatsApp Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WhatsAppLoginContent(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
