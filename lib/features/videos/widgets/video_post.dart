import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

/*
state:
영상이 멈췄는지
사용자가 댓글을 보고있는지
 */
class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost(
      {Key? key, required this.onVideoFinished, required this.index})
      : super(key: key);

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/100floor.mp4');
  late final AnimationController _animationController;
  bool _isPaused = false;
  final Duration _animationDuration =
      Duration(milliseconds: 200); //재생 버튼 클릭했을때의 크기 애니메이션
  int? _maxLines = 2;
  TextOverflow _tagsOverflow = TextOverflow.ellipsis;
  bool _isTagsOpend = false;
  String _openAndCloseTagText = '자세히 보기';

  void _onTagsOpenAndClose() {
    if (_isTagsOpend == true) {
      //열려있으면 닫아야한다.
      _isTagsOpend = false;
      _maxLines = 2;
      _tagsOverflow = TextOverflow.ellipsis;
      _openAndCloseTagText = '자세히 보기';
    } else {
      //닫혀있으면 열려야한다.
      _isTagsOpend = true;
      _maxLines = null;
      _tagsOverflow = TextOverflow.visible;
      _openAndCloseTagText = '숨기기';
    }
    setState(() {});
  }

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      //전체길이 == 현재 사용자의 동영상 위치
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished(); //동영상이 끝났을때의 함수를 불러온다.
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize(); //initialize를 해줘야한다.
    await _videoPlayerController.setLooping(true);
    setState(() {
      //build method가 VideoPlayerController가 initialize된것과 플레이 된것을 알게해주려고
    });
    _videoPlayerController.addListener(() {
      //controller의 변화를 감지한다.
      _onVideoChange();
    });
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      // 시작값의 default 값은 lowerBound인데, value로 다르게 정해줄수있다.
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    //한번에 하나씩만 재생해주기위해 만든 method
    //info.visibleFraction: widget이 얼만큼 보이는지 나타낸다. 0~1
    //비디오가 100프로 보이고 아직 재생중이 아니면 재생해준다.
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse(); //upperbound에서 lowerbound로 변화시켜준다.
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Container(
                    color: Colors.black, //pink,
                  ), //controller가 준비가 되면 videoPlayer를 보여주고 아니면 검은색 화면을 보여준다.
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                    animation: _animationController, //controller가 변할때마다
                    //AnimatedBuilder의 child는 builder()의 두번째 파라메터(nana)와 같다.
                    child: AnimatedOpacity(
                      duration: _animationDuration,
                      opacity: _isPaused ? 1 : 0,
                      child: const FaIcon(
                        FontAwesomeIcons.play,
                        color: Colors.white,
                        size: Sizes.size52,
                      ),
                    ),
                    builder: (context, nana) {
                      //build를 실행시킨다.
                      return Transform.scale(
                        scale: _animationController.value,
                        child: nana,
                      );
                    }),
              ),
            ),
          ),
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@kangsudal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size20,
                    color: Colors.white,
                  ),
                ),
                Gaps.v10,
                Text(
                  '100 floor in Busan',
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    color: Colors.white,
                  ),
                ),
                Gaps.v7,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 200,
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                        '#고소공포증 #brave #aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.size16,
                          color: Colors.white,
                        ),
                        maxLines: _maxLines,
                        overflow: _tagsOverflow,
                      ),
                    ),
                    GestureDetector(
                      onTap: _onTagsOpenAndClose,
                      child: Text(
                        _openAndCloseTagText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Sizes.size16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            left: 10,
            bottom: 20,
          ),
          Positioned(
            right: 10,
            bottom: 20,
            child: Column(
              children: [
                CircleAvatar(),
                Gaps.v20,
                VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: '80.8k',
                ),
                Gaps.v20,
                VideoButton(icon: FontAwesomeIcons.solidComment, text: '580'),
                Gaps.v20,
                VideoButton(icon: FontAwesomeIcons.share, text: '580'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
