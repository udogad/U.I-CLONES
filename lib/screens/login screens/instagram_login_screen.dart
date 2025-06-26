import 'package:flutter/material.dart';

class InstagramLoginScreen extends StatelessWidget {
  const InstagramLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Instagram Login')),
      body: const InstagramLoginContent(),
    );
  }
}

class InstagramLoginContent extends StatefulWidget {
  const InstagramLoginContent({super.key});
  @override
  State<InstagramLoginContent> createState() => _InstagramLoginContentState();
}

class _InstagramLoginContentState extends State<InstagramLoginContent> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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

  void _togglePasswordVisibility() =>
      setState(() => _isPasswordVisible = !_isPasswordVisible);

  void _login() async {
    if (!_isButtonEnabled || _isLoading) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Instagram',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Satisfy', fontSize: 50.0),
              ),
              const SizedBox(height: 40.0),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'Username or email',
                ),
              ),
              const SizedBox(height: 12.0),
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                onSubmitted: (_) => _login(),
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _isButtonEnabled && !_isLoading ? _login : null,
                child: _isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
