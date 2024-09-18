import 'package:flutter/material.dart';


class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Please read the following terms and conditions carefully. '
                          'By using our app, you agree to comply with and be bound by '
                          'the following terms:',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    // Terms content
                    const Text('1. Acceptance of Terms: By accessing Sure Crop, you agree to these terms.'),
                    const SizedBox(height: 8),
                    const Text('2. User Responsibilities: Users are responsible for the accuracy of data input.'),
                    const SizedBox(height: 8),
                    const Text('3. Privacy Policy: We ensure the confidentiality of user data.'),
                    const SizedBox(height: 8),
                    const Text('4. License: Sure Crop grants you a limited, non-exclusive license to use the app.'),
                    const SizedBox(height: 8),
                    const Text('5. Prohibited Use: The app must not be used for illegal purposes.'),
                    const SizedBox(height: 8),
                    const Text('6. Modifications: We may modify these terms at any time.'),
                    const SizedBox(height: 8),
                    const Text('7. Payments: Payments through the app must comply with local regulations.'),
                    const SizedBox(height: 8),
                    const Text('8. Termination: Sure Crop may terminate your access at any time.'),
                    const SizedBox(height: 8),
                    const Text('9. Warranty Disclaimer: The app is provided "as is", with no warranties.'),
                    const SizedBox(height: 8),
                    const Text('10. Limitation of Liability: We are not liable for any damages caused by use of the app.'),
                    const SizedBox(height: 8),
                    const Text('11. Governing Law: These terms are governed by the Indian law .'),
                    const SizedBox(height: 8),
                    const Text('12. Contract Negotiation: The app facilitates contract negotiation but is not responsible for outcomes.'),
                    const SizedBox(height: 8),
                    const Text('13. Market Data: Real-time market data is for reference only and not guaranteed.'),
                    const SizedBox(height: 8),
                    const Text('14. Support: Support services are provided at our discretion.'),
                    const SizedBox(height: 8),
                    const Text('15. User Content: Users are responsible for the content they upload.'),
                    const SizedBox(height: 8),
                    const Text('16. Advertising: We may display ads on the platform.'),
                    const SizedBox(height: 8),
                    const Text('17. Compliance: Users must comply with all local laws and regulations.'),
                    const SizedBox(height: 8),
                    const Text('18. Disputes: Any disputes arising from app usage will be resolved in the applicable courts.'),
                    const SizedBox(height: 8),
                    const Text('19. Changes to Services: We may change, suspend, or discontinue any part of the app at any time.'),
                    const SizedBox(height: 8),
                    const Text('20. Contact: For any queries, contact support@surecrop.com.'),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}