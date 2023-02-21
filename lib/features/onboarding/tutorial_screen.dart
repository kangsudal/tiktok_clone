import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

enum Direction { right, left }

enum Page { first, second }

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  Direction _direction = Direction.right;
  Page _showingPage = Page.first;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size24),
            child: AnimatedCrossFade(
              firstChild: PageWidget(
                title: 'Watch cool videos!',
                subtitle:
                    'Videos are personalized for you based on wat you watch, like, and share.',
              ),
              secondChild: PageWidget(
                title: 'Follow the rules',
                subtitle: '나이아가라폭포',
              ),
              crossFadeState: _showingPage == Page.first
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond, //뭐 먼저 보여줄지
              duration: Duration(milliseconds: 300),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size24,
                vertical: Sizes.size24,
              ),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: _showingPage == Page.first ? 0 : 1,
                child: CupertinoButton(
                  child: Text('Enter the app'),
                  onPressed: _onEnterAppTap,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ),
      ),
    );
  }

  void _onPanUpdate(DragUpdateDetails details) {
    //사용자가 스와이프 하는 방향을 알게해주는 메서드
    if (details.delta.dx > 0) {
      //to the right
      setState(() {
        _direction = Direction.right;
      });
    } else {
      //to the left
      setState(() {
        _direction = Direction.left;
      });
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (_direction == Direction.left) {
      setState(() {
        _showingPage = Page.second;
      });
    } else {
      setState(() {
        _showingPage = Page.first;
      });
    }
  }

  void _onEnterAppTap() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => MainNavigationScreen(),
        ),
        (route) => false);
  }
}

class PageWidget extends StatelessWidget {
  PageWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v52,
        Text(
          title,
          style: TextStyle(
            fontSize: Sizes.size40,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gaps.v16,
        Text(
          subtitle,
          style: TextStyle(
            fontSize: Sizes.size20,
          ),
        ),
      ],
    );
  }
}
