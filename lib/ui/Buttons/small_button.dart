import 'package:flutter/material.dart';
class SmallButton extends StatelessWidget {
  Function()? onPressed;
  String buttonText = "ButtonText";

  SmallButton({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF00966A),
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 20,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(12),
        ),
      ),
      child: Text(buttonText),
    );
  }
}
