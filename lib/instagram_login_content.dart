import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; // Assuming theme_provider.dart is in the same directory

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

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_updateButtonState);
 _passwordController.addListener(_updateButtonState);
    _updateButtonState(); // Initial check
  }
 bool _isButtonEnabled = false;


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  void _login() async {
    if (_isButtonEnabled && !_isLoading) { // Corrected to use _isButtonEnabled directly
      setState(() {
        _isLoading = true;
      });

      // Simulate a login process
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      // In a real app, you would typically send these to a server for authentication.
      // For this example, we'll just print them.
      debugPrint('Username: ${_usernameController.text}');
      debugPrint('Password: ${_passwordController.text}');
      // In a real app, you would navigate after successful login
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

 return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Login'),
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
 // Adjusted for better contrast
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 80.0),
              Image.asset(
                'assets/images/instagram_logo.png', // Ensure you have this asset
                height: 80.0,
                color: isDarkMode ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Phone number, email or username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) => FocusScope.of(context).nextFocus(),
 ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: !_isPasswordVisible,
 textInputAction: TextInputAction.done, // Keyboard action: Done
                onSubmitted: (_) => _login(),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton( // Corrected disabled color handling in onPressed
                onPressed: _isButtonEnabled && !_isLoading ? _login : null, // Corrected to use _isButtonEnabled directly
                style: ElevatedButton.styleFrom(
 backgroundColor: Colors.blue, // Corrected disabled color handling in onPressed
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: _isLoading
                    ? const SizedBox(
                        height: 20.0,
                        width: 20.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          strokeWidth: 2.0,
                        ),
                      )
                    : const Text(
 'Log In',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  
                },
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
 const Text("Don't have an account? "), // Added const back, as it is a const constructor
                  TextButton(
                    onPressed: () {
                      
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
