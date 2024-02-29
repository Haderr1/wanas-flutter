import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/sendMessageField.dart';
import 'Message.dart';

class chatScreen extends StatefulWidget {
  @override
  static const String routeName = 'chatScreen';

  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('wanas'),
        backgroundColor: Color(0xFF00966A),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            color: Colors.black,
            onPressed: () {
              // Call function to handle deletion
              //_deletechatScreen(context);
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Message(
            imagePath: 'assets/images/logochat.png',
            text:
                'Lorem ipsum dolor sit amet consec. Lobortis magna viverra viverra vitae tort?',
          ),
          sendMessageField()
        ],
      ),
    );
  }
}
