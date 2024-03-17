import 'package:flutter/material.dart';
class SmallButton extends StatelessWidget {
  Function()? onPressed;
  String ButtonText = "ButtonText";

  SmallButton({Key? key, required this.onPressed, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
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
      child: Text(ButtonText),
    );
  }
}
