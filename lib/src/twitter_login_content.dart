import 'package:flutter/material.dart';

class TwitterLoginContent extends StatefulWidget {
  const TwitterLoginContent({super.key});

  @override
  State<TwitterLoginContent> createState() => _TwitterLoginContentState();
}

class _TwitterLoginContentState extends State<TwitterLoginContent> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
 bool _isLoading = false;
 bool _isPasswordVisible = false;

 @override
  void initState() {
 super.initState();
    _usernameController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    _updateButtonState(); // Initial check
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
          _usernameController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }

  void _login() async {
    if (!_isButtonEnabled) return;

    setState(() {
      _isLoading = true;
    });

    // Simulate a network requestawait Future.delayed(Duration(seconds: 2));
    await Future.delayed(Duration(seconds: 2));

    setState(() {
 _isLoading = false;
    });

    // Here you would typically navigate to the next screen or handle login failure
    debugPrint('Username: ${_usernameController.text}');
    debugPrint('Password: ${_passwordController.text}');
  }

 @override
 build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold( // Added const
 backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
 backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
 leading: IconButton(
 icon: Icon(Icons.arrow_back, color: isDarkMode ? Colors.white : Colors.black),
 onPressed: () => Navigator.pop(context),
        ),
      ),
 body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
 child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40.0),
 Center(
              child: Icon(
                Icons.flutter_dash, // Placeholder for Twitter logo
 size: 50.0,
 color: Colors.blue,
              ),
 ),
            const SizedBox(height: 40.0),
            Text(
              'Log in to Twitter',
 style: theme.textTheme.headlineSmall?.copyWith(
 color: isDarkMode ? Colors.white : Colors.black,
 fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
 TextField(
              controller: _usernameController,
 style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
 decoration: InputDecoration(
                labelText: 'Phone, email, or username',
 labelStyle: TextStyle(color: isDarkMode ? Colors.grey[600] : Colors.grey[700]),
 enabledBorder: UnderlineInputBorder( // Added const
                  borderSide: BorderSide(color: isDarkMode ? Colors.grey[800]! : Colors.grey[400]!),
                ),
 focusedBorder: UnderlineInputBorder( // Added const
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
 textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).nextFocus(),
            ),
            const SizedBox(height: 20.0),
 TextField(
              controller: _passwordController,
 style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
 decoration: InputDecoration(
                labelText: 'Password',
 labelStyle: TextStyle(color: isDarkMode ? Colors.grey[600] : Colors.grey[700]),
 enabledBorder: UnderlineInputBorder( // Added const
                  borderSide: BorderSide(color: isDarkMode ? Colors.grey[800]! : Colors.grey[400]!),
                ),
 focusedBorder: UnderlineInputBorder( // Added const
                  borderSide: BorderSide(color: Colors.blue),
 ),
 suffixIcon: IconButton(
                  icon: Icon(
 Icons.visibility,
 color: isDarkMode ? Colors.grey[600] : Colors.grey[700],
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
 obscureText: !_isPasswordVisible, // Toggle password visibility
 textInputAction: TextInputAction.done, // Keyboard action: Done
              onSubmitted: (_) => _login(), // Call _login on Done
            ),
            const SizedBox(height: 30.0),
            _isLoading
                ? const CircularProgressIndicator() // Loading indicator
                : ElevatedButton(
                    onPressed: _isButtonEnabled ? _login : null, // Call _login
                    style: ElevatedButton.styleFrom(
 backgroundColor: Colors.blue,
 shape: RoundedRectangleBorder(
 borderRadius: BorderRadius.circular(30.0),
                        ),
 padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
 child: Center(child: Text('Log in', style: TextStyle(fontSize: 16.0, color: Colors.white))),
 ),
            const SizedBox(height: 20.0),
 Center(
              child: TextButton(
 onPressed: () {
 // Handle forgot password
                },
 child: Text(
 'Forgot password?',
 style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
 Center(
              child: TextButton(
 onPressed: () {
 // Handle sign up
                },
 child: Text(
 'Sign up for Twitter',
 style: TextStyle(color: Colors.blue), // Use Colors.blue for Twitter links
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}