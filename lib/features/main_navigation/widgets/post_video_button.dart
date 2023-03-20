import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  final bool inverted;

  const PostVideoButton({
    Key? key,
    required this.inverted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 20, //오른쪽으로부터 20 떨어지게, 왼쪽으로 민다.
          child: Container(
            height: 30,
            width: 25,
            // padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Color(0xff61D4F0),
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
          ),
        ), //왼쪽 하늘색 박스
        Positioned(
          left: 20,
          child: Container(
            height: 30,
            width: 25,
            // padding: EdgeInsets.symmetric(horizontal: Sizes.size8),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
          ),
        ), //오른쪽 분홍박스
        Container(
          height: 30,
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          // width: 25,
          decoration: BoxDecoration(
            color: inverted ? Colors.black : Colors.white,
            //Home 화면이 아니면 +버튼의 배경색이 검정이 되야한다.
            borderRadius: BorderRadius.circular(Sizes.size6),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: inverted ? Colors.white : Colors.black,
              //Home 화면이 아니라면 +가 하얀색이 되야한다.
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
