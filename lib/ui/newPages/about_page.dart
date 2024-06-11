import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to WANAS!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'At WANAS, our mission is to revolutionize mental health support by leveraging the power of artificial intelligence and machine learning. Our virtual therapist application is designed to provide immediate, accessible, and personalized mental health care to anyone, anywhere, at any time.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Our Mission',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We believe that everyone deserves access to high-quality mental health support, regardless of their location or financial situation. Our goal is to break down the barriers that prevent people from seeking help by offering a confidential, non-judgmental, and easy-to-use platform.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Our Vision',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'We envision a world where mental health care is readily available to all, where stigma no longer stands in the way of seeking help, and where technology enhances the quality and reach of mental health services.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Our Team',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'The WANAS team is composed of passionate professionals from diverse backgrounds, including mental health experts, AI researchers, software developers, and user experience designers. We are united by a common goal: to make a positive impact on mental health care through innovative technology.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
