import 'package:flutter/material.dart';
import 'package:waanaass/ui/chatsmenu/chat_card.dart';
import '../Api/ChatsApi.dart';
import 'menu_scaf.dart';

class ChatsMain extends StatefulWidget {
  final int personaid;
  ChatsMain({required this.personaid, super.key});
  static const String routeName = 'ChatsMenu';
  @override
  State<ChatsMain> createState() => _ChatsMainState();
}

class _ChatsMainState extends State<ChatsMain> {
  _ChatsMainState();
  late int personaid;
  late Future<List<Chat>> futurechatlist;
  late List<Chat> chatslist;
  @override
  void initState() {
    super.initState();
    personaid = widget.personaid;
    print("personaid: $personaid");
    futurechatlist = getChatsOfPersonaId(personaid);
  }

  @override
  Widget build(BuildContext context) {
    return MenuScaf(
        title: "ChatsMenu",
        body: FutureBuilder<List<Chat>>(
            future: futurechatlist,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Text('Loading....');
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    if (snapshot.hasData) {
                      chatslist = snapshot.data!;
                      return ListMaker(chatslist, personaid,widget.key);
                    } else {
                      return const Text('empty');
                    }
                  }
              }
            }));
  }
}

class ListMaker extends StatefulWidget {
  final List<Chat> chatslist;
  final int personaid;

  const ListMaker( this.chatslist,  this.personaid, Key?key): super(key: key);

  @override
  State<ListMaker> createState() => _Chatsliststate();
}

class _Chatsliststate extends State<ListMaker> {
  late List<Chat> chatslist;
  late final int personaid;


  @override
  void initState() {
    super.initState();
    chatslist = widget.chatslist;
    personaid = widget.personaid;
    print("eelpersonaaid: $personaid");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatslist.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == chatslist.length) {
          return AddChatButton(onpressed: () {
            addNewChat(personaid);
            addtochatlist();
          });
        }
        return ChatsCard(elchat: chatslist[index],personaid: personaid,key: widget.key,);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          height: 2,
          thickness: 2,
          indent: 0,
          endIndent: 0,
          color: Color(0xffB6B6BE),
        );
      },
    );
  }

  void addtochatlist() {
    Chat c = Chat(chatid: chatslist.length + 1);
    setState(() {
      widget.chatslist.add(c);
    });
  }
}
