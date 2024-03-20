import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/chatScreen.dart';
import '../Api/ChatsApi.dart';

class ChatsCard extends StatelessWidget {
  final Chat elchat;
  ChatsCard({required this.elchat, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => chatScreen()),
        );
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xFF00966A)),
        foregroundColor: MaterialStatePropertyAll(Color(0xffffffff)),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 25)),
        padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
      ),
      child: Text("chat " + elchat.chatid.toString()),
    );
  }
}

class AddChatButton extends StatelessWidget {
  final int personaid;
  final Function addtolist;
  AddChatButton({
    required this.personaid,
    required this.addtolist,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        addNewChat(personaid);
        addtolist();
      },
      icon: Icon(Icons.add, color: Colors.white, size: 33),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Color(0xFF00966A)),
      ),
    );
  }
}
