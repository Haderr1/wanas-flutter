import 'package:flutter/material.dart';
import '../Buttons/small_button.dart';
import '../TalkToMePage/talk_to_me_screen.dart';

class ShowChatsHomeCard extends StatelessWidget {
  const ShowChatsHomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF66C0A6),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(14),
          color: Colors.white.withOpacity(0.7),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Show previous conversation',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8.0),
                  SmallButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TalkToMeScreen()),
                      );                    },
                    buttonText: 'Show',
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0), // Spacer
            // Second Column
            Image.asset(
              'assets/images/showcardimg.png', // Provide your image path here
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
