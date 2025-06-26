import 'package:flutter/material.dart';
import 'package:myapp/facebook_login_content.dart' show FacebookLoginContent;
import 'package:myapp/instagram_login_content.dart' show InstagramLoginContent;
import 'package:myapp/tiktok_login_content.dart' show TikTokLoginContent; // Import for debugPrint
import 'package:myapp/twitter_login_content.dart' show TwitterLoginContent;
// We will build the Instagram login screen directly in this file for now.

import 'package:provider/provider.dart';
import 'package:myapp/theme_provider.dart';

void main() => debugPrint('App started');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Instagram Login Clone',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            // Apply custom font (replace 'InstagramFont' with your font family name)
            primaryColor: Colors.blue, // Example primary color for buttons
            brightness: Brightness.light, // Default to light mode
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue, brightness: Brightness.dark),
            brightness: Brightness.dark,
            primaryColor: Colors.blue,
          ),
          themeMode: themeProvider.themeMode, // Use themeMode from ThemeProvider
          home: AppLoginScreens(),
         
        );
      }),
    );
  }
}
class AppLoginScreens extends StatefulWidget {
  const AppLoginScreens({super.key});

  @override
  State<AppLoginScreens> createState() => _AppLoginScreensState();
}

class _AppLoginScreensState extends State<AppLoginScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Login Screens'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_4),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Instagram Login'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const InstagramLoginContent()));
              },
            ),
            ListTile(
              title: const Text('Twitter Login'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TwitterLoginContent()));
              },

            ),
            ListTile(
              title: const Text('Facebook Login'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FacebookLoginContent()));
              },

            ),
            
            ListTile(
              title: const Text('TikTok Login'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TikTokLoginContent()));
              },
            ),
            ListTile(
              title: const Text('WhatsApp Login'),
              onTap: () {
 debugPrint('WhatsApp login tile tapped'); // Use debugPrint
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
