import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/chatScreen.dart';

class startCard extends StatelessWidget {
  const startCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE0F8E9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Talk to Wanas to',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'start check-in',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => chatScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00966A),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20, // Change the font size
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 7),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Change the border radius
                    ),
                  ),
                  child: Text('Start'),
                ),
              ],
            ),
            SizedBox(width: 24),
            Image.asset(
              'assets/images/cardills.png', // Replace with the actual path to your image
            ),
          ],
        ),
      ),
    );
  }
}
