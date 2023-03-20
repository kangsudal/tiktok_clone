import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'LIVE',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Discover"),
          elevation: 1, //AppBar에 실선 넣기
          bottom: TabBar(
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
            splashFactory: NoSplash.splashFactory,
            //클릭했을때 잉크자국같은게 없도록
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            for (var tab in tabs)
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}
