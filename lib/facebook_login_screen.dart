import 'package:flutter/material.dart';

class FacebookLoginScreen extends StatelessWidget {
  const FacebookLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // Back button is automatically added by Navigator
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Replace with Facebook logo or text
                Text(
                  'facebook',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                const SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(labelText: 'Email or Phone'),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                ElevatedButton(onPressed: () {}, child: const Text('Log In')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}