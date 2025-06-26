import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class WhatsAppLoginScreen extends StatelessWidget {
  const WhatsAppLoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color whatsappGreen = isDarkMode
        ? const Color(0xFF00A884)
        : const Color(0xFF128C7E);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter your phone number'),
        backgroundColor: whatsappGreen,
        foregroundColor: Colors.white,
      ),
      body: const WhatsAppLoginContent(),
    );
  }
}

class WhatsAppLoginContent extends StatefulWidget {
  const WhatsAppLoginContent({super.key});
  @override
  WhatsAppLoginContentState createState() => WhatsAppLoginContentState();
}

class WhatsAppLoginContentState extends State<WhatsAppLoginContent> {
  final _phoneNumberController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _isLoading = false;
  String _selectedCountryCode = "+1"; // Default

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _updateButtonState() =>
      setState(() => _isButtonEnabled = _phoneNumberController.text.isNotEmpty);

  void _onNextPressed() async {
    if (!_isButtonEnabled || _isLoading) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _isLoading = false);
    debugPrint(
      'Phone Number: $_selectedCountryCode${_phoneNumberController.text}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Color whatsappGreen = isDarkMode
        ? const Color(0xFF00A884)
        : const Color(0xFF128C7E);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'WhatsApp will need to verify your account. What\'s my number?',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              CountryCodePicker(
                onChanged: (country) => setState(
                  () => _selectedCountryCode = country.dialCode ?? '+1',
                ),
                initialSelection: 'US',
                favorite: const ['+1', 'US'],
              ),
              Expanded(
                child: TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: whatsappGreen, width: 2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: _isButtonEnabled && !_isLoading ? _onNextPressed : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: whatsappGreen,
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
                : const Text('NEXT'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
