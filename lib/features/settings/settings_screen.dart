import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text('about this app...'),
            onTap: () => showAboutDialog(
                context: context,
                applicationVersion: '1.0',
                applicationLegalese:
                    "All rights is reserved. Please don't copy me."),
          ),
          AboutListTile(),
        ],
      ),
    );
  }
}
