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
        //ListView 전체에 padding을 줄 수 있지만 Dismissible과 ListTile의 모양을위해 New Text에 패딩을 주기로했다.
        children: [
          Gaps.v14,
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              //ListView에 ListTile이 아닌것도 들어올 수 있다는거
              'New',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Gaps.v14,
          Dismissible(
            key: Key('x'),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,//Container안에 있는 item들을 정렬하게해준다.
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: FaIcon(
                  FontAwesomeIcons.checkDouble,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Theme.of(context).primaryColor,
              alignment: Alignment.centerRight,//Container안에 있는 item들을 정렬하게해준다.
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: FaIcon(
                  FontAwesomeIcons.trashCan,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            child: ListTile(
              onTap: () {},
              //contentPadding: EdgeInsets.zero,
              //If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used. 원래는 16인데 왼쪽에 딱붙이려면 zero로 바꾸면 된다.
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
          ),
        ],
      ),
    );
  }
}
