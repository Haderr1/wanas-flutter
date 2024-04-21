import 'package:flutter/material.dart';
import 'package:waanaass/ui/Buttons/small_button.dart';

class StartCard extends StatelessWidget {

  const StartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFE0F8E9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Talk to Wanas to',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                Text(
                  'start check-in',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 16),
                // SmallButton(onPressed: () {
                // }, buttonText: "Start")
              ],
            ),
            const SizedBox(width: 24),
            Image.asset(
              'assets/images/cardills.png',
            ),
          ],
        ),
      ),
    );
  }
}
