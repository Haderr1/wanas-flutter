import 'package:flutter/material.dart';
class PrimaryButton extends StatelessWidget {
  Function()? onTap;
  String ButtonText = "ButtonText";

  PrimaryButton({Key? key, required this.onTap, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Color(0xFF00966A),
          borderRadius: BorderRadius.circular(80),
        ),
        child: Center(
          child: Text(
            ButtonText,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
