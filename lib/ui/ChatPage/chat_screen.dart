import 'package:flutter/material.dart';
import 'package:waanaass/ui/ChatPage/send_message_field.dart';
import '../Api/chat_api.dart';
import '../LocalDB/db_helper.dart';
import 'message.dart';


class ChatScreen extends StatefulWidget {
  final int personaId;
  final int chatId;

  const ChatScreen({required this.personaId, required this.chatId, Key? key}) : super(key: key);

  @override
  ChatScreenState createState() => ChatScreenState();
  static const String routeName = 'chatScreen';

  static ChatScreenState of(BuildContext context) {
    final ChatScreenState? result =
    context.findAncestorStateOfType<ChatScreenState>();
    assert(result != null, 'No ChatScreen found in context');
    return result!;
  }
}

class ChatScreenState extends State<ChatScreen> {
  List<MessageModel> messages = [];
  late int personaId;
  late int chatId;
  late DatabaseHelper _databaseHelper;

  @override
  void initState() {
    super.initState();
    personaId = widget.personaId;
    chatId = widget.chatId;
    _databaseHelper = DatabaseHelper();
    _loadMessages();
  }

  void clearMessages() async {
    await _databaseHelper.clearMessages(chatId,personaId);
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final messagesFromDb = await _databaseHelper.getMessages(chatId, personaId);
    setState(() {
      messages = messagesFromDb
          .map((messageMap) => MessageModel(
        text: messageMap['text'] as String,
        isUserMessage: messageMap['isUserMessage'] == 1,
      ))
          .toList();
    });
  }

  void sendUserMessage(String message) {
    _addMessage(message, true);
    _databaseHelper.insertMessage(message, true, chatId, personaId);
    sendMessage(message, personaId, chatId).then((response) {
      _addMessage(response, false);
      _databaseHelper.insertMessage(response, false, chatId, personaId);
    }).catchError((error) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Error"),
            content: Text("Failed to send message: $error"),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
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
        title: const Text('Wanas'),
        backgroundColor: const Color(0xFF00966A),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
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
                  imagePathAi: 'assets/images/logo chat.png',
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
