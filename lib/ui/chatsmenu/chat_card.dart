import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/chatScreen.dart';
import '../Api/ChatsApi.dart';

class ChatsCard extends StatelessWidget {
  final Chat elchat;
  const ChatsCard({required this.elchat, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => chatScreen()),
        );
      },
      style: greenButtonStyle,
      child: Text("chat ${elchat.chatid.toString()}"),
    );
  }
}

class AddChatButton extends StatelessWidget {
  final Function onpressed;
  const AddChatButton({required this.onpressed, super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onpressed();
        },
        icon: const Icon(Icons.add, color: Colors.white, size: 33),
        style: greenButtonStyle);
  }
}

ButtonStyle greenButtonStyle = const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Color(0xFF00966A)),
  foregroundColor: MaterialStatePropertyAll(Color(0xffffffff)),
  textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 25)),
  padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
);
