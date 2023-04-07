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
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
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
                SizedBox(height: 15),
                FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38.0),
                  child: Text(
                    'In the Material Design language, this represents a divider. Vertical dividers can be used in horizontally scrolling lists, such as a ListView with ListView.scrollDirection set to Axis.horizontal.',
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.link,
                      size: 15,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'https://kangsudal.github.io',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    //탭바 버튼 위아래 실선
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey,
                        width: 0.25,
                      ),
                    ),
                  ),
                  child: TabBar(
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(vertical: 10),
                    indicatorColor: Colors.black,
                    //TabBarIndicatorSize.label: tabs item 크기에 딱맞게 / .tab: 넓게
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.grid_4x4_rounded),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: FaIcon(
                          FontAwesomeIcons.heart,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
