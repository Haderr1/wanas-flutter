import 'package:flutter/material.dart';

class MenuScaf extends StatelessWidget {
  final Widget body;
  final bool hasDrawer;
  final String title;

  const MenuScaf(
      {super.key,
      required this.body,
      this.hasDrawer = false,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: hasDrawer ? Drawer() : null,
      appBar: AppBar(
        actions: [
          const Icon(Icons.search),
          const SizedBox(
            width: 10,
          )
        ],
        foregroundColor: Colors.white,
        elevation: 3.0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Color(0xff00966A),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: body,
      ),
    );
  }
}
