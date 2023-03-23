import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  void _onDmPressed() {}

  void _onActivityTap(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ActivityScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        elevation: 1,
        actions: [
          IconButton(
            onPressed: _onDmPressed,
            icon: FaIcon(FontAwesomeIcons.paperPlane),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              _onActivityTap(context);
            },
            title: Text(
              'Activity',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size20,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
          ListTile(
            onTap: () {},
            leading: Container(
              width: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle, //circle avatar대신 이렇게 동그라미를 만들 수 있다.
                color: Colors.blue,
              ),
              child: Center(
                //center를 넣어줘야 원 안에 맞춰진다.
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                ),
              ),
            ),
            title: Text(
              'New followers',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            subtitle: Text('Messages from followers will appear here'),
            trailing: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: Sizes.size20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
