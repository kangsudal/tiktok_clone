import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/*
state:
영상이 멈췄는지
사용자가 댓글을 보고있는지
 */
class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  const VideoPost({Key? key, required this.onVideoFinished}) : super(key: key);

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/100floor.mp4');

  void _onVideoChange() {
    if(_videoPlayerController.value.isInitialized){
      //전체길이 == 현재 사용자의 동영상 위치
      if(_videoPlayerController.value.duration == _videoPlayerController.value.position){
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize(); //initialize를 해줘야한다.
    _videoPlayerController.play();
    setState(() {
      //build method가 VideoPlayerController가 initialize된것과 플레이 된것을 알게해주려고
    });
    _videoPlayerController.addListener(() { _onVideoChange();});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _videoPlayerController.value.isInitialized
              ? VideoPlayer(_videoPlayerController)
              : Container(
                  color: Colors.black,//pink,
                ), //controller가 준비가 되면 videoPlayer를 보여주고 아니면 검은색 화면을 보여준다.
        ),
      ],
    );
  }
}
