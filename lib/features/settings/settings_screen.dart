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
        ],
      ),
    );
  }
}
