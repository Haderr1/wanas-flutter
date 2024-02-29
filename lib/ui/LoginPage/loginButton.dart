import 'package:flutter/material.dart';
import '../talktomepage/talkToMeScreen.dart';

class LoginButton extends StatelessWidget {
  Function()? onTap;
  String ButtonText = "ButtonText";

  LoginButton({Key? key, required this.onTap, required this.ButtonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => talktome()),
        );
      },
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
