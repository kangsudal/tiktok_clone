import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({Key? key}) : super(key: key);

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();
  int _itemCount = 4;
  List<Color> colors = [
    Colors.orangeAccent,
    Colors.teal,
    Colors.pink,
    Colors.purple,
  ];

  void _onPageChanged(idx) {
    //idx: 유저가 가려는 페이지
    //애니메이션 default값인 Curves.decelerate를 변경
    _pageController.animateToPage(
      idx,
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
    );

    //무한 스크롤링(마지막 페이지에 도달하려할때 4페이지 추가해줌)
    if (idx == _itemCount - 1) {
      _itemCount += 4;
      colors.addAll([
        Colors.orangeAccent,
        Colors.teal,
        Colors.pink,
        Colors.purple,
      ]);
    }

    setState(() {}); //해줘야 itemCount의 값이 변한게 반영된다.
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      //세로로
      itemCount: _itemCount,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: colors[index],
          child: Center(
            child: Text(
              "Screen $index",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
      onPageChanged: _onPageChanged,
    );
  }
}
