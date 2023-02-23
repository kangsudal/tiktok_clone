import 'package:flutter/material.dart';

/*
state:
영상이 멈췄는지
사용자가 댓글을 보고있는지
 */
class VideoPost extends StatefulWidget {
  const VideoPost({Key? key}) : super(key: key);

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
