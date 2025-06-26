import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/src/theme_provider.dart'; // Assuming theme_provider.dart is in the same directory

class TikTokLoginContent extends StatefulWidget {
  const TikTokLoginContent({super.key});

  @override
  State<TikTokLoginContent> createState() => _TikTokLoginContentState();
}

class _TikTokLoginContentState extends State<TikTokLoginContent> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  bool _isLoading = false;
  bool _isPasswordVisible = false;

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

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled =
          _usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _login() async {
    if (!_isButtonEnabled) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 50), // Adjust spacing as needed
            // TikTok Logo/Text - Placeholder, replace with actual asset
            Icon(
              Icons.tiktok, // Using a placeholder icon
              size: 60,
              color: isDarkMode
                  ? Colors.white
                  : Colors.black, // Adjust color for theme
            ),
            const SizedBox(height: 40), // Adjust spacing
            Text(
              'Log in to TikTok',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 30), // Adjust spacing
            TextField(
              controller: _usernameController,
              keyboardType:
                  TextInputType.emailAddress, // Adjust keyboard type as needed
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'Phone, email, or username',
                hintStyle: TextStyle(
                  color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
                ),
                filled: true,
                fillColor: isDarkMode
                    ? Colors.grey[900]
                    : Colors.grey[200], // Adjust fill color for theme
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15.0,
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 15), // Adjust spacing
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) {
                if (_isButtonEnabled) {
                  _login();
                }
              },
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: isDarkMode ? Colors.grey[600] : Colors.grey[400],
                ),
                filled: true,
                fillColor: isDarkMode
                    ? Colors.grey[900]
                    : Colors.grey[200], // Adjust fill color for theme
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 15.0,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: isDarkMode
                        ? Colors.grey[600]
                        : Colors.grey[400], // Adjust icon color for theme
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 25), // Adjust spacing
            _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isDarkMode ? Colors.white : Colors.black,
                      ), // Adjust color for theme
                    ),
                  )
                : ElevatedButton(
                    onPressed: _isButtonEnabled ? _login : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isButtonEnabled
                          ? Colors
                                .red // TikTok's primary color
                          : isDarkMode
                          ? Colors.grey[800]
                          : Colors.grey[300], // Disabled color for theme
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 16,
                        color: _isButtonEnabled
                            ? Colors.white
                            : (isDarkMode
                                  ? Colors.grey[600]
                                  : Colors.grey[800]), // Text color for theme
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            const SizedBox(height: 20), // Adjust spacing
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: isDarkMode
                      ? Colors.blueAccent
                      : Colors.blue, // Adjust color for theme
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 50), // Adjust spacing
            // Sign up link - Placeholder
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  ), // Adjust color for theme
                ),
                GestureDetector(
                  onTap: () {
                    // Handle sign up navigation
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ), // TikTok's secondary color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
