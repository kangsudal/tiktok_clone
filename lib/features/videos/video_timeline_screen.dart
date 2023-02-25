import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tiktok_clone/features/videos/widgets/video_post.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({Key? key}) : super(key: key);

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  final PageController _pageController = PageController();
  int _itemCount = 4;
  final _scrollDuration = const Duration(milliseconds: 250);
  final Curve _scrollCurve = Curves.linear;

  void _onPageChanged(idx) {
    //idx: 유저가 가려는 페이지
    //애니메이션 default값인 Curves.decelerate를 변경
    _pageController.animateToPage(
      idx,
      duration: _scrollDuration,
      curve: _scrollCurve,
    );

    //무한 스크롤링(마지막 페이지에 도달하려할때 4페이지 추가해줌)
    if (idx == _itemCount - 1) {
      _itemCount += 4;
    }

    setState(() {}); //해줘야 itemCount의 값이 변한게 반영된다.
  }

  void _onVideoFinished() {
    _pageController.nextPage(
      duration: _scrollDuration,
      curve: _scrollCurve,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      //세로로
      itemCount: _itemCount,
      itemBuilder: (BuildContext context, int index) {
        //몇번째 동영상을 보고있는지 알기위해 index를 넘겨준다.
        return VideoPost(onVideoFinished: _onVideoFinished, index: index);
      },
      onPageChanged: _onPageChanged,
    );
  }
}
