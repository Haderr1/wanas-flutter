import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String imagePathAi;
  final String imagePathUser;

  final String text;
  final bool isUserMessage;

  const Message({
    Key? key,
    required this.imagePathAi,
    required this.imagePathUser,
    required this.text,
    required this.isUserMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment:
        isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUserMessage)
            CircleAvatar(
              backgroundImage: AssetImage(imagePathAi),
              radius: 20,

            ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                color: isUserMessage ? const Color(0xFFE0F8E9) : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isUserMessage ? 16 : 0),
                  topRight: Radius.circular(isUserMessage ? 0 : 16),
                  bottomLeft: const Radius.circular(16),
                  bottomRight: const Radius.circular(16),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isUserMessage ? Colors.black : Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          if (isUserMessage)
            CircleAvatar(
              backgroundImage: AssetImage(imagePathUser),
              radius: 20,
            ),

        ],
      ),
    );
  }
}
