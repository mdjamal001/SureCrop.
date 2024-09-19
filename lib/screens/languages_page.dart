import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String? _selectedLanguage;

  final List<Map<String, String>> _languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'hi', 'name': 'हिंदी'}, // Hindi
    {'code': 'te', 'name': 'తెలుగు'}, // Telugu
    {'code': 'ta', 'name': 'தமிழ்'}, // Tamil
    {'code': 'mr', 'name': 'मराठी'}, // Marathi
    {'code': 'kn', 'name': 'ಕನ್ನಡ'}, // Kannada
  ];

  // Colors for each language box
  final List<Color> _colors = [
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.purpleAccent,
  ];

  void _onLanguageSelect(String languageCode) {
    setState(() {
      _selectedLanguage = languageCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Language'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: _languages.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final language = _languages[index];
                  final isSelected = _selectedLanguage == language['code'];
                  return GestureDetector(
                    onTap: () => _onLanguageSelect(language['code']!),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: _colors[index], // Background color
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.transparent, // Border color changes if selected
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        language['name']!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: _selectedLanguage == null
                  ? null // Disable button if no language is selected
                  : () {
                Navigator.pushNamed(context, '/signup');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Proceed',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
