import 'package:flutter/material.dart';
import 'package:spark/screens/terms_and_conditions.dart';

class HelpInfoPage extends StatelessWidget {
  const HelpInfoPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Info'),
        backgroundColor: Colors.blueAccent,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
             const Text(
                'Why We Created This App',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'This app was designed to spark children’s interest in STEM fields by offering engaging challenges and activities. Our goal is to make learning fun and accessible for everyone.',
                style: TextStyle(fontFamily: 'sparkFont', fontSize: 16.0),
              ),
             const SizedBox(height: 20.0),

              
             const Text(
                'Contact Us',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
             const SizedBox(height: 8.0),
             const Text(
                'We’d love to hear your feedback! Feel free to reach out to us:',
                style: TextStyle(fontFamily: 'sparkFont', fontSize: 16.0),
              ),
             const SizedBox(height: 8.0),
             const Text(
                '📧 slim.belabria@ieee.org',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
             const SizedBox(height: 10.0),
              const Text(
                '📸 Instagram: @Spark',
                style: TextStyle(
                  fontFamily: 'sparkFont',
                  fontSize: 16.0,
                  color: Colors.blue,
                ),
              ),
             const SizedBox(height: 20.0),

              GestureDetector(
                onTap: () {
                
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TermsAndConditions()),
                  );
                },
                child:const Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontFamily: 'sparkFont',
                    fontSize: 16.0,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}