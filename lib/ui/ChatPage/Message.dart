import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String imagePath;
  final String text;

  Message({
    super.key,
    required this.imagePath,
    required this.text,
    this.textDirection,
  });

  TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        textDirection: textDirection,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: Color(0xFFE0F8E9),
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
