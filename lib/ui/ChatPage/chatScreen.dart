import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/sendMessageField.dart';
import '../Api/ChatApi.dart';
import '../LocalDB/DBHelper.dart';
import 'Message.dart';


class chatScreen extends StatefulWidget {
  final int personaid;
  final int chatid;

  chatScreen({required this.personaid, required this.chatid, Key? key}) : super(key: key);

  @override
  _chatScreenState createState() => _chatScreenState();
  static const String routeName = 'chatscreen';

  static _chatScreenState of(BuildContext context) {
    final _chatScreenState? result =
    context.findAncestorStateOfType<_chatScreenState>();
    assert(result != null, 'No ChatScreen found in context');
    return result!;
  }
}

class _chatScreenState extends State<chatScreen> {
  List<MessageModel> messages = [];
  late int personaid;
  late int chatid;
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    personaid = widget.personaid;
    chatid = widget.chatid;
    _databaseHelper = DatabaseHelper();
    _loadMessages();
  }
  void clearMessages() async {
    await _databaseHelper.clearTable();
    _loadMessages(); // Reload messages after clearing the table
  }
  Future<void> _loadMessages() async {
    final messagesFromDb = await _databaseHelper.getMessages(chatid, personaid);
    setState(() {
      messages = messagesFromDb
          .map((messageMap) => MessageModel(
        text: messageMap['text'] as String,
        isUserMessage: messageMap['isUserMessage'] == 1,
      ))
          .toList();
    });
  }

  void sendMessagee(String message) {
    _addMessage(message, true);
    _databaseHelper.insertMessage(message, true, chatid, personaid);
    sendMessage(message, personaid, chatid, context).then((response) {
      _addMessage(response, false);
      _databaseHelper.insertMessage(response, false, chatid, personaid);
    }).catchError((error) {
      _addMessage("Error: $error", false);
    });
  }

  void _addMessage(String message, bool isUserMessage) {
    setState(() {
      messages.add(MessageModel(text: message, isUserMessage: isUserMessage));
    });
  }

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
            onPressed: clearMessages
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Message(
                  imagePathAi: 'assets/images/logochat.png',
                  imagePathUser: 'assets/images/happy.png',
                  text: message.text,
                  isUserMessage: message.isUserMessage,
                );
              },
            ),
          ),
          SendMessageField(),
        ],
      ),
    );
  }
}

class MessageModel {
  final String text;
  final bool isUserMessage;

  MessageModel({required this.text, required this.isUserMessage});
}
