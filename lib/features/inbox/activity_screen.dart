import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All activity'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Gaps.v14,
          Text(
            //ListView에 ListTile이 아닌것도 들어올 수 있다는거
            'New',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Gaps.v14,
          ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.zero,
            //If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used. New와 같게하기위해 패딩을 없애주었다. 원래는 16
            leading: Container(
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400),
                color: Colors.white,
              ),
              child: Center(
                child: FaIcon(FontAwesomeIcons.bell),
              ),
            ),
            title: RichText(
              text: TextSpan(
                text: 'Account updates:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black, //꼭써줘야한다 default가 white인듯
                  fontSize: 17,
                ),
                children: [
                  TextSpan(
                    text: ' Upload longer videos',
                    style: TextStyle(fontWeight: FontWeight.normal), //덮어씌운다
                  ),
                  TextSpan(
                    text: ' 1h',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.chevronRight,
                size: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
