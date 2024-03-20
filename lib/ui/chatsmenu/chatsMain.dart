import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/chatsmenu/chatCard.dart';
import '../Api/ChatsApi.dart';
import 'menuScaf.dart';

class chatsMain extends StatefulWidget {
  final int personaid;
  const chatsMain({required this.personaid, super.key});
  static const String routeName = 'ChatsMenu';
  @override
  State<chatsMain> createState() => _ChatsMainState(personaid);
}

class _ChatsMainState extends State<chatsMain> {
  final int personaid;
  _ChatsMainState(this.personaid);

  late Future<List<Chat>> futurechatlist;
  late List<Chat> chatslist;
  @override
  void initState() {
    super.initState();
    futurechatlist = getChatsOfPersonaId(personaid);
  }

  // @override
  // void didChangeDependencies() {
  //     // TODO: implement didChangeDependencies
  //     super.didChangeDependencies();
  //
  //   }
  @override
  Widget build(BuildContext context) {
    return MenuScaf(
        title: "ChatsMenu",
        body: FutureBuilder<List<Chat>>(
            future: futurechatlist,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Text('Loading....');
                default:
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    if (snapshot.hasData) {
                      chatslist = snapshot.data!;
                      return ListMaker(chatslist, personaid);
                    } else {
                      return Text('empty');
                    }
                  }
              }
            }));
  }
}

class ListMaker extends StatefulWidget {
  final List<Chat> chatslist;
  final int personaid;

  ListMaker(this.chatslist, this.personaid);
  _chatsliststate createState() => _chatsliststate();
}

class _chatsliststate extends State<ListMaker> {
  late List<Chat> chatslist;

  @override
  void initState() {
    super.initState();
    chatslist = widget.chatslist;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: chatslist.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == chatslist.length) {
          return AddChatButton(
            personaid: widget.personaid,
            addtolist: addtochatlist,
          );
        }
        return ChatsCard(elchat: chatslist[index]);
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
      chatslist.add(c);
    });
  }
}
