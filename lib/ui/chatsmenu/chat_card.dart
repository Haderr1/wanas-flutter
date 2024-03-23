import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/chat_screen.dart';
import '../Api/chats_api.dart';

class ChatsCard extends StatelessWidget {
  final Chat chat;
  final int personaId;

  const ChatsCard({required this.chat, required this.personaId, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatScreen(
                    personaId: personaId,
                    chatId: chat.chatId,
                    key: super.key,
                  )),
        );
      },
      style: greenButtonStyle,
      child: Text("chat ${chat.chatId.toString()}",),
    );
  }
}

class AddChatButton extends StatelessWidget {
  final Function onPressed;
  const AddChatButton({required this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onPressed();
        },
        icon: const Icon(Icons.add, color: Color(0xFF00966A), size: 32),
        style: greenButtonStyle);
  }
}

ButtonStyle greenButtonStyle = ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll(Colors.white),
  foregroundColor: const MaterialStatePropertyAll(Color(0xFF00966A)),
  textStyle: const MaterialStatePropertyAll(
      TextStyle(fontSize: 25, color: Colors.white)),
  padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
  shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(
        color: Color(0xFF00966A),
        width: 2,
      ),
    ),
  ),
);
