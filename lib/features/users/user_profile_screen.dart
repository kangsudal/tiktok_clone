import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('수달'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: FaIcon(
                FontAwesomeIcons.gear,
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CircleAvatar(
                radius: 43,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "@수달이",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(width: 5),
                  FaIcon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: Colors.lightBlueAccent.shade100,
                    size: 15,
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                //VerticalDivider은 father의 높이를 필요로하기때문에 SizedBox로 감싸주었다.
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    indicator('37', 'Following'),
                    verticalDivdier(),
                    indicator('10.5M', "Followers"),
                    verticalDivdier(),
                    indicator('149.3M', 'Likes'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget indicator(String value, String type) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          type,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }

  VerticalDivider verticalDivdier() {
    return const VerticalDivider(
      width: 45,
      thickness: 0.3,
      indent: 10,
      endIndent: 20,
      color: Colors.grey,
    );
  }
}
