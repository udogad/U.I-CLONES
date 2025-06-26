import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// --- Main Application Entry Point ---
void main() {
  // The runApp function inflates the given widget and attaches it to the screen.
  runApp(const MyApp());
}

// --- Placeholder for ThemeProvider ---
// In your real app, this would be in a separate file.
class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode =
      ThemeMode.light; // Default to light mode for demonstration
  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }
}

// --- Main Application Widget ---
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
            debugShowCheckedModeBanner: false,
            // --- Light Theme Definition ---
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.light,
              ),
              primaryColor: Colors.blue,
              brightness: Brightness.light,
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            // --- Dark Theme Definition ---
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue,
                brightness: Brightness.dark,
              ),
              brightness: Brightness.dark,
              primaryColor: Colors.blue,
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            themeMode: themeProvider.themeMode,
            // MODIFIED: The home screen is now the Instagram Login Screen
            home: const InstagramLoginScreen(),
            // Defines the named routes for navigation if needed later
            routes: {'/home': (context) => const HomeScreen()},
          );
        },
      ),
    );
  }
}

// --- Instagram Login Screen (Stateless container) ---
class InstagramLoginScreen extends StatelessWidget {
  const InstagramLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the ThemeProvider to toggle the theme
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      // The body is the stateful content widget you created
      body: const InstagramLoginContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        child: const Icon(Icons.brightness_6),
      ),
    );
  }
}

// --- Instagram Login Content (Your code, integrated) ---
class InstagramLoginContent extends StatefulWidget {
  const InstagramLoginContent({super.key});

  @override
  State<InstagramLoginContent> createState() => _InstagramLoginContentState();
}

class _InstagramLoginContentState extends State<InstagramLoginContent> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled =
          _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _login() async {
    if (_isButtonEnabled && !_isLoading) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a network request
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }

      debugPrint('Username: ${_usernameController.text}');
      debugPrint('Password: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 60),
              // FIXED: Replaced Image.asset with a styled Text widget as a placeholder.
              // To use your image, replace this with:
              // Image.asset('assets/images/instagram_logo.png', height: 80, color: isDarkMode ? Colors.white : Colors.black)
              Text(
                'Instagram',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Billabong', // A common font for this logo style
                  fontSize: 50.0,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Phone number, email or username',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: !_isPasswordVisible,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _login(),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _isButtonEnabled && !_isLoading ? _login : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  disabledBackgroundColor: Colors.blue.withOpacity(0.5),
                  padding: const EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                          strokeWidth: 2.0,
                        ),
                      )
                    : const Text(
                        'Log In',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
              ),
              const SizedBox(height: 12.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: isDarkMode ? Colors.blue[300] : Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Placeholder HomeScreen (Not used initially, but available for routing) ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome to the Home Screen!')),
    );
  }
}
