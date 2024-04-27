import 'package:flutter/material.dart';
import '../Buttons/small_button.dart';

class ShowChatsHomeCard extends StatelessWidget {
  final String imagePath;
  final String cardText;
  final String buttonText;
  final BorderRadiusGeometry borderRadius;
  Function()? onPressed;

  ShowChatsHomeCard({
    Key? key,
    required this.imagePath,
    required this.cardText,
    required this.buttonText,
    required this.borderRadius,
    required this.onPressed,
  }) : super(key: key);

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
          borderRadius: borderRadius,
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
                  Text(
                    cardText,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 8.0),
                  SmallButton(
                    onPressed: onPressed,
                    buttonText: buttonText,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16.0), // Spacer
            // Second Column
            SizedBox(
              width: 85,
              height: 100,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
