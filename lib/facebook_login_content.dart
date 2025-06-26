import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Assuming theme_provider.dart is in the same directory

class FacebookLoginContent extends StatefulWidget {
  const FacebookLoginContent({super.key});
  
  @override
  State<FacebookLoginContent> createState() => _FacebookLoginContentState();
}

class _FacebookLoginContentState extends State<FacebookLoginContent> {
  final _emailPhoneController =  TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isButtonEnabled = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailPhoneController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();
    // Cancel any pending futures or timers if you add them for the loading indicator
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _emailPhoneController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  void _login() async {
    if (_isButtonEnabled && !_isLoading) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a login process
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // In a real app, you would perform authentication here
      debugPrint(
          'Logging in with: ${_emailPhoneController.text} and ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Adjust spacing based on screen height
            // Facebook Logo/Text
            Text(
              'facebook',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.blue[700], // Facebook blue
              ),
            ),
            SizedBox(height: 50.0),
            // Email or Phone Text Field
            TextField(
              controller: _emailPhoneController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              decoration: InputDecoration(
                hintText: 'Email or Phone Number',
                hintStyle: TextStyle(color: isDarkMode ? Colors.grey[600] : Colors.grey[600]),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              ),
            ),
            SizedBox(height: 16.0),
            // Password Text Field
            TextField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _login(), // Trigger login on "Done"
              style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(color: isDarkMode ? Colors.grey[600] : Colors.grey[600]),
                filled: true,
                fillColor: isDarkMode ? Colors.grey[800] : Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            // Login Button
            ElevatedButton(
              onPressed: _isButtonEnabled && !_isLoading ? _login : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isButtonEnabled ? Colors.blue[700] : (isDarkMode ? Colors.blue[900] : Colors.blue[300]),
                padding: EdgeInsets.symmetric(vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0,
              ),
              child: _isLoading
                  ? SizedBox(
                      height: 20.0,
                      width: 20.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2.0,
                      ),
                    )
                  : Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(height: 20.0),
            // Forgot Password Link
            TextButton(
              onPressed: () {
                // Handle forgot password
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: isDarkMode ? Colors.blue[300] : Colors.blue[700],
                  fontSize: 14.0,
                ),
              ),
            ),
            Expanded(child: Container()), // Flexible space to push content up
             // Sign Up Section (Simplified)
            Divider(
                color: isDarkMode ? Colors.grey[700] : Colors.grey[400],
                thickness: 1.0),
            const SizedBox(height: 20.0),
            Center(
              child: TextButton(
                onPressed: () {}, // Handle sign up
                child: Text('Create New Account',
                    style: TextStyle(
                        color: isDarkMode ? Colors.blue[300] : Colors.blue[700],
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}