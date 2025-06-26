import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'theme_provider.dart'; // Assuming theme_provider.dart is in the same directory

class WhatsAppLoginContent extends StatefulWidget {
  const WhatsAppLoginContent({super.key});

  @override
  WhatsAppLoginContentState createState() => WhatsAppLoginContentState();
}

class WhatsAppLoginContentState extends State<WhatsAppLoginContent> {
  final _countryCodeController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isLoading = false;
  final FocusNode _countryCodeFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_updateButtonState);
    _countryCodeController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _countryCodeController.dispose();
    _countryCodeFocusNode.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled =
          _phoneNumberController.text.isNotEmpty; // Basic check for now
    });
  }

  void _onNextPressed() {
    if (_isButtonEnabled && !_isLoading) {
      setState(() {
        _isLoading = true;
      });
      // Simulate a network delay
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });
      });
      debugPrint(
        'Phone Number: ${_countryCodeController.text}${_phoneNumberController.text}',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Enter your phone number',
          style: TextStyle(color: Colors.white),
        ), // WhatsApp specific title and text color
        backgroundColor: isDarkMode
            ? const Color(0xFF202C33)
            : const Color(0xFF075E54), // WhatsApp AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'WhatsApp will need to verify your account. What\'s my number?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: isDarkMode ? Colors.white70 : Colors.black87,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CountryCodePicker(
                  onChanged: (CountryCode? countryCode) {
                    _countryCodeController.text = countryCode?.dialCode ?? '';
                  },
                  initialSelection: 'US', // Set initial country code
                  favorite: const ['+1', 'US'], // Add favorite country codes
                  showFlag: true,
                  showCountryOnly: false,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      _onNextPressed();
                    },
                    decoration: InputDecoration(
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: isDarkMode ? Colors.white54 : Colors.black38,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.white60 : Colors.black54,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: isDarkMode ? Colors.tealAccent : Colors.teal,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              'Carrier SMS charges may apply',
              style: TextStyle(
                fontSize: 12.0,
                color: isDarkMode ? Colors.white54 : Colors.black45,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: _isButtonEnabled ? _onNextPressed : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode
                    ? const Color(0xFF075E54)
                    : const Color(0xFF128C7E), // WhatsApp button color
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 15.0,
                ),
              ),
              child: _isLoading
                  ? SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          isDarkMode ? Colors.black : Colors.white,
                        ),
                      ),
                    )
                  : const Text(
                      'NEXT',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
