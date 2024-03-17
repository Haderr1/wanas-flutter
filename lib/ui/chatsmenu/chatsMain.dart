import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waanaass/ui/chatsmenu/chatCard.dart';
import '../Api/Api.dart';
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
  @override
  void initState() {
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
        body: Center(
            child: FutureBuilder<List<Chat>>(
                future: futurechatlist,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Text('Loading....');
                    default:
                      if (snapshot.hasError)
                        return Text('Error: ${snapshot.error}');
                      else {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ChatsCard(elchat: snapshot.data![index]);
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
                        } else {
                          return Text('empty');
                        }
                      }
                  }
                })));
  }
}
