import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VideoTimelineScreen extends StatefulWidget {
  const VideoTimelineScreen({Key? key}) : super(key: key);

  @override
  State<VideoTimelineScreen> createState() => _VideoTimelineScreenState();
}

class _VideoTimelineScreenState extends State<VideoTimelineScreen> {
  int _itemCount = 4;
  List<Color> colors = [
    Colors.orangeAccent,
    Colors.teal,
    Colors.pink,
    Colors.purple,
  ];

  void _onPageChanged(idx) {
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
      scrollDirection: Axis.vertical, //세로로
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
