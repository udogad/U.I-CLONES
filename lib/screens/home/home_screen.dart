import 'package:flutter/material.dart';
import 'package:myapp/app/theme_provider.dart' show ThemeProvider;
import 'package:myapp/widgets/custom_logo.dart'
    show WhatsAppLogo, TikTokLogo, InstagramLogo, FacebookLogo, TwitterXLogo;
import 'package:myapp/widgets/login_card.dart' show LoginCard;
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login UI Clones'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => themeProvider.toggleTheme(),
            tooltip: 'Toggle Theme',
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: const [
          LoginCard(
            name: 'Instagram',
            logo: InstagramLogo(size: 50),
            route: '/instagram',
          ),
          LoginCard(
            name: 'Facebook',
            logo: FacebookLogo(size: 50),
            route: '/facebook',
          ),
          LoginCard(
            name: 'Twitter',
            logo: TwitterXLogo(size: 40),
            route: '/twitter',
          ),
          LoginCard(
            name: 'TikTok',
            logo: TikTokLogo(size: 50),
            route: '/tiktok',
          ),
          LoginCard(
            name: 'WhatsApp',
            logo: WhatsAppLogo(size: 50),
            route: '/whatsapp',
          ),
        ],
      ),
    );
  }
}
