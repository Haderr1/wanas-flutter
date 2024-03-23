import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/chatScreen.dart';
import 'package:waanaass/ui/TalkToMePage/personsCard.dart';
import '../Api/ChatsApi.dart';

class ChatsCard extends StatelessWidget {
  final Chat elchat;
  final int personaid;

  const ChatsCard({required this.elchat, required this.personaid, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => chatScreen(personaid: personaid,chatid:elchat.chatid ,key: super.key ,)),
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
        icon: const Icon(Icons.add, color: Color(0xFF00966A), size: 32),
        style: greenButtonStyle);
  }
}


ButtonStyle greenButtonStyle =  ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll(Colors.white),
  foregroundColor: const MaterialStatePropertyAll(Color(0xFF00966A)),
  textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 25,color: Colors.white)),
  padding: const MaterialStatePropertyAll(EdgeInsets.all(16)),
  shape: MaterialStateProperty.all<OutlinedBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(
        color: Color(0xFF00966A),
        width: 2,
      ),
    ),
  ),

);
