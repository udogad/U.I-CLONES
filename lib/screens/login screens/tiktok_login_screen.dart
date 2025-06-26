import 'package:flutter/material.dart';
import 'package:myapp/widgets/custom_logo.dart' show TikTokLogo;

class TikTokLoginScreen extends StatelessWidget {
  const TikTokLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TikTok Login')),
      body: const TikTokLoginContent(),
    );
  }
}

class TikTokLoginContent extends StatefulWidget {
  const TikTokLoginContent({super.key});
  @override
  State<TikTokLoginContent> createState() => _TikTokLoginContentState();
}

class _TikTokLoginContentState extends State<TikTokLoginContent> {
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 50),
          const TikTokLogo(size: 60),
          const SizedBox(height: 40),
          const Text(
            'Log in to TikTok',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              hintText: 'Phone, email, or username',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),
            onSubmitted: (_) => _login(),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: _isButtonEnabled && !_isLoading ? _login : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text('Log in'),
          ),
        ],
      ),
    );
  }
}
