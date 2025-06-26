import 'package:flutter/material.dart';

class TwitterLoginScreen extends StatelessWidget {
  const TwitterLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // AppBar with back button is automatically included
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView( // Added for responsiveness
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Placeholder for Twitter Logo
                Icon(
                  Icons.verified, // Using a generic icon for now
                  size: 80.0,
                  color: Colors.blue,
                ),
                const SizedBox(height: 40.0),
                Text(
                  'Log in to Twitter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Phone, email, or username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement login logic here
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    textStyle: TextStyle(fontSize: 18.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: const Text('Log in'),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    // Implement forgot password logic here
                  },
                  child: const Text('Forgot password?'),
                ),
                TextButton(
                  onPressed: () {
                    // Implement sign up logic here
                  },
                  child: const Text('Sign up for Twitter'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}