import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('General'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: const Icon(Icons.notifications, color: Color(0xFF00966A)),
            title: Text('Receive Notifications'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.g_translate, color: Color(0xFF00966A)),
            title: Text('Language'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.color_lens, color: Color(0xFF00966A)),
            title: Text('Theme'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.groups, color: Color(0xFF00966A)),
            title: Text('About Us'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Others'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.feedback, color: Color(0xFF00966A)),
            title: Text('Help & Feedback'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.feed, color: Color(0xFF00966A)),
            title: Text('Terms & Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined, color: Color(0xFF00966A)),
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),

        ],
      ),
    );
  }
}
