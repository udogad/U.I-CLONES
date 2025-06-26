import 'package:flutter/material.dart';

class InstagramLogo extends StatelessWidget {
  final double size;
  const InstagramLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.purple, Colors.red, Colors.orange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Icon(Icons.camera_alt, size: size, color: Colors.white),
    );
  }
}

class FacebookLogo extends StatelessWidget {
  final double size;
  const FacebookLogo({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.facebook, size: size, color: Colors.blue.shade700);
  }
}

class TwitterXLogo extends StatelessWidget {
  final double size;
  const TwitterXLogo({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      'X',
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: isDark ? Colors.white : Colors.black,
      ),
    );
  }
}

class TikTokLogo extends StatelessWidget {
  final double size;
  const TikTokLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.music_note,
          size: size,
          color: const Color(0xFF69C9D0),
        ), // Cyan
        Positioned(
          left: size * 0.15,
          top: size * 0.1,
          child: Icon(
            Icons.music_note,
            size: size,
            color: const Color(0xFFEE1D52),
          ), // Pink
        ),
        Positioned(
          left: size * 0.05,
          top: size * 0.05,
          child: Icon(
            Icons.music_note,
            size: size,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ],
    );
  }
}

class WhatsAppLogo extends StatelessWidget {
  final double size;
  const WhatsAppLogo({super.key, required this.size});
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.message, size: size, color: Colors.green);
  }
}
