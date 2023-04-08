import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        //탭바 버튼 위아래 실선
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey,
            width: 0.25,
          ),
        ),
        color: Colors.white,
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
    );
  }

  @override
  double get maxExtent => 46.5;

  @override
  double get minExtent => 46.5;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
