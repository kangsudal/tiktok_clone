import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationsChanged(bool? newCheckValue) {
    if (newCheckValue == null) return;
    setState(() {
      _notifications = newCheckValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          Switch.adaptive(
              value: _notifications, onChanged: _onNotificationsChanged),
          //os에 따라 렌더링한다.
          CupertinoSwitch(
              value: _notifications, onChanged: _onNotificationsChanged),
          Switch(value: _notifications, onChanged: _onNotificationsChanged),
          SwitchListTile(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text(
              'Enable notifications',
            ),
          ),
          //이것을 사용하는것을 추천한다고함
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text(
              'This is SwitchListTile.adaptive',
            ),
          ),
          Checkbox(value: _notifications, onChanged: _onNotificationsChanged),
          CheckboxListTile(
            value: _notifications,
            onChanged: _onNotificationsChanged,
            title: Text('Enable notifications'),
            activeColor: Colors.black,
          ),
          ListTile(
            title: Text('What is your birthday?'),
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime.now(),
              );
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              //기간선택
              final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                  //builder를 안쓰면 main에서 지정한 backgroundColor: Colors.white가 적용된다.
                  builder: (context, calendar) {
                    //맨위에 wrapper의 background 색을 바꿔준다.
                    return Theme(
                      data: ThemeData(
                        appBarTheme: AppBarTheme(
                          //backgroundColor를 지정안해주면 파란색이된다.
                          backgroundColor: Colors.black,
                        ),
                      ),
                      //child엔 지금의 위젯 Theme만 바꿀거라고 명시하는것, showDateRangePicker인 calendar를 준다. 아니면 모든 Theme이 바뀌는듯.
                      child: calendar!,
                    );
                  });
              print(date);
              print(time);
              print(booking);
            },
          ),
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
          ListTile(
            title: Text(
              'Log out (iOS)',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Are you sure?'),
                  content: Text("Don't go ~"),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('No'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoDialogAction(
                      child: Text('Yes'),
                      isDestructiveAction: true,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              'Log out (Android)',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: FaIcon(FontAwesomeIcons.handshakeSimple),
                  title: Text('Are you sure?'),
                  content: Text('Dont go~'),
                  actions: [
                    TextButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.personRunning,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
