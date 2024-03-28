import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/chatsmenu/chat_card.dart';
import '../Api/chats_api.dart';
import 'menu_scaf.dart';

class ChatsMain extends StatefulWidget {
  final int personaId;
  const ChatsMain({required this.personaId, super.key});
  static const String routeName = 'ChatsMenu';
  @override
  State<ChatsMain> createState() => _ChatsMainState();
}

class _ChatsMainState extends State<ChatsMain> {
  _ChatsMainState();
  late int personaId;
  late Future<List<Chat>> futureChatList;
  late List<Chat> chatsList;
  @override
  void initState() {
    super.initState();
    personaId = widget.personaId;
    if (kDebugMode) {
      print("personaId: $personaId");
    }
    futureChatList = getChatsOfPersonaId(personaId);
  }

  @override
  Widget build(BuildContext context) {
    return MenuScaf(
        title: "ChatsMenu",
        body: FutureBuilder<List<Chat>>(
            future: futureChatList,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Text('Loading....');
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    if (snapshot.hasData) {
                      chatsList = snapshot.data!;
                      return ListMaker(chatsList, personaId,widget.key);
                    } else {
                      return const Text('empty');
                    }
                  }
              }
            }));
  }
}

class ListMaker extends StatefulWidget {
  final List<Chat> chatsList;
  final int personaId;

  const ListMaker( this.chatsList,  this.personaId, Key?key): super(key: key);

  @override
  State<ListMaker> createState() => _ChatsListState();
}

class _ChatsListState extends State<ListMaker> {
  late List<Chat> chatsList;
  late final int personaId;


  @override
  void initState() {
    super.initState();
    chatsList = widget.chatsList;
    personaId = widget.personaId;
    if (kDebugMode) {
      print("eelpersonaaid: $personaId");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24,top: 24),
      child: ListView.separated(
        itemCount: chatsList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == chatsList.length) {
            return AddChatButton(onPressed: () {
              addNewChat(personaId);
              addToChatList();
            });
          }
          return ChatsCard(chat: chatsList[index],personaId: personaId,key: widget.key,);
        }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(height: 16,) ; },


      ),
    );
  }

  void addToChatList() {
    Chat c = Chat(chatId: chatsList.length);
    setState(() {
      widget.chatsList.add(c);
    });
  }
}
