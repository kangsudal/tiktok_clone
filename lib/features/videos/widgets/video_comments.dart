import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

/*
댓글보기 버튼을 누르면 나오는 bottom sheet
 */
class VideoComments extends StatefulWidget {
  const VideoComments({Key? key}) : super(key: key);

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      //decoration: BoxDecoration borderRadius까지 함께해줘야한다. 아님 에러남
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(Sizes.size10),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade50,
          title: Text(
            '580 comments',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: ListView.separated(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
          itemCount: 10,
          itemBuilder: (context, idx) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              //댓글 길이가 길어져도 썸네일이 가운데가 아니라 위로 갈 수 있게
              children: [
                CircleAvatar(
                  radius: 18,
                ),
                Gaps.h10, //썸네일과 글자사이 간격
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I am a comment',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v3,
                      Text(
                        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbcccccccccccccccccccccccccccddddddddddd',
                      ),
                    ],
                  ),
                ),
                Gaps.h10, //댓글과 좋아요 버튼 사이 간격
                Column(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.heart,
                      size: Sizes.size20,
                      color: Colors.grey.shade500,
                    ),
                    Gaps.v2,
                    Text(
                      '52.2K',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: Sizes.size14,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              Gaps.v20, //댓글들 사이의 간격
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: [
              CircleAvatar(),
            ],
          ),
        ),
      ),
    );
  }
}
