import 'package:flutter/material.dart';
import 'package:myapp/src/home_screen.dart' show HomeScreen;
import 'package:myapp/src/splash_screen.dart' show SplashScreen;
import 'package:myapp/src/theme_provider.dart' show ThemeProvider;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'UI LOGIN CLONES',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
              // Apply custom font (replace 'InstagramFont' with your font family name)
              primaryColor: Colors.blue, // Example primary color for buttons
              brightness: Brightness.light, // Default to light mode
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.dark,
              ),
              brightness: Brightness.dark,
              primaryColor: Colors.blue,
            ),
            themeMode:
                themeProvider.themeMode, // Use themeMode from ThemeProvider
            home: SplashScreen(),
            routes: {'/home': (context) => HomeScreen()},
          );
        },
      ),
    );
  }
}
