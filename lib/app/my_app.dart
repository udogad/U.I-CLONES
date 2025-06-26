import 'package:flutter/material.dart';
import 'package:myapp/app/app_theme.dart' show AppTheme;
import 'package:myapp/app/theme_provider.dart' show ThemeProvider;
import 'package:myapp/screens/home/home_screen.dart' show HomeScreen;
import 'package:myapp/screens/login%20screens/facebook_login_screen.dart'
    show FacebookLoginScreen;
import 'package:myapp/screens/login%20screens/instagram_login_screen.dart'
    show InstagramLoginScreen;
import 'package:myapp/screens/login%20screens/tiktok_login_screen.dart'
    show TikTokLoginScreen;
import 'package:myapp/screens/login%20screens/twitter_login_screen.dart'
    show TwitterLoginScreen;
import 'package:myapp/screens/login%20screens/whatsapp_login_screen.dart'
    show WhatsAppLoginScreen;
import 'package:myapp/screens/splash/splash_screen.dart' show SplashScreen;
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'UI LOGIN CLONES',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialRoute: '/splash',
          routes: {
            '/splash': (context) => const SplashScreen(),
            '/home': (context) => const HomeScreen(),
            '/facebook': (context) => const FacebookLoginScreen(),
            '/instagram': (context) => const InstagramLoginScreen(),
            '/twitter': (context) => const TwitterLoginScreen(),
            '/tiktok': (context) => const TikTokLoginScreen(),
            '/whatsapp': (context) => const WhatsAppLoginScreen(),
          },
        );
      },
    );
  }
}
