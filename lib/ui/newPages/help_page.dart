import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: ListView(
        children: _buildExpansionTiles(),
      ),
    );
  }

  List<Widget> _buildExpansionTiles() {
    List<Item> data = generateItems();

    return data.map<Widget>((Item item) {
      return ExpansionTileWithColor(
        headerValue: item.headerValue,
        expandedValue: item.expandedValue,
        icon: Icons.help_outline, // Add an icon for each question
      );
    }).toList();
  }
}

class ExpansionTileWithColor extends StatefulWidget {
  final String headerValue;
  final String expandedValue;
  final IconData icon;

  const ExpansionTileWithColor({
    super.key,
    required this.headerValue,
    required this.expandedValue,
    required this.icon,
  });

  @override
  _ExpansionTileWithColorState createState() => _ExpansionTileWithColorState();
}

class _ExpansionTileWithColorState extends State<ExpansionTileWithColor> {
  Color _tileColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _tileColor,
      child: ExpansionTile(
        leading: Icon(widget.icon), // Add the icon here
        title: Text(widget.headerValue),
        onExpansionChanged: (bool expanded) {
          setState(() {
            _tileColor = expanded ? Colors.lightGreen[50]! : Colors.white;
          });
        },
        children: <Widget>[
          ListTile(
            title: Text(widget.expandedValue),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
  });

  String expandedValue;
  String headerValue;
}

List<Item> generateItems() {
  return [
    Item(
      headerValue: 'What is the goal of the WANAS application?',
      expandedValue:
      'To provide immediate, accessible, and personalized mental health support using AI and machine learning.',
    ),
    Item(
      headerValue: 'How does the WANAS application ensure data privacy and security?',
      expandedValue:
      'By implementing robust encryption and privacy measures to protect user data.',
    ),
    Item(
      headerValue: 'How does the WANAS application handle user feedback?',
      expandedValue:
      'By collecting and analyzing feedback to continuously improve the app.',
    ),
    Item(
      headerValue: 'What is the benefit of using a mood tracker in the WANAS application?',
      expandedValue:
      'It helps users monitor their emotional well-being and allows the virtual therapist to offer personalized support.',
    ),
  ];
}
