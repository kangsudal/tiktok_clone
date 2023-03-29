import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notifications = List.generate(20, (index) => '${index}h');

  final List<Map<String, dynamic>> _tabs = [
    {
      "title": "All activity",
      "icon": FontAwesomeIcons.solidMessage,
    },
    {
      "title": "Likes",
      "icon": FontAwesomeIcons.solidHeart,
    },
    {
      "title": "Comments",
      "icon": FontAwesomeIcons.solidComments,
    },
    {
      "title": "Mentions",
      "icon": FontAwesomeIcons.at,
    },
    {
      "title": "Followers",
      "icon": FontAwesomeIcons.solidUser,
    },
    {
      "title": "From TikTok",
      "icon": FontAwesomeIcons.tiktok,
    }
  ];

  bool _showBarrier = false; //위젯트리에서 AnimatedModalBarrier를 보여주고 숨기는 역할

  //#1. 애니메이션 정보를 가지고있는 AnimationController를 생성
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(
      milliseconds: 200, //애니메이션 속도
    ),
  ); //Animation을 만들기위해 컨트롤러 생성/late를 꼭 붙여줘야한다. 아니면 initState에서 생성해줘야한다.

  //#실제 애니메이션인 Animation을 생성
  //AnimationController를 통해 Tween을 animation하겠다. _arrowAnimation과 _animationController를 연결시켜주었다.
  late final Animation<double> _arrowAnimation = Tween(begin: 0.0, end: 0.5)
      .animate(_animationController); //1.0: 1 turn 360도, 0.5: half turn 180도

  //panel을 움직이는 애니메이션
  late final Animation<Offset> _panelAnimation = Tween(
    begin: Offset(0, -1), //y축으로 -100% 올리자. -0.5는 -50% 반만 올리자(반만 가려짐)
    end: Offset(0, 0),
  ).animate(_animationController);

  //색깔을 바꾸는 애니메이션
  late final Animation<Color?> _barrierAnimation = ColorTween(
    begin: Colors.transparent,
    end: Colors.black45,
  ).animate(_animationController);

  void _onDismissed(String notification) {
    //dismiss된 notification을 받는다.
    setState(() {
      //dismiss한 아이템을 리스트에서 삭제시킨다. widget tree에서 삭제시킨다.
      _notifications.remove(notification);
    });
  }

  void _toggleAnimations() async {
    /*
    AppBar를 누르거나 AnimatedModalBarrier를 눌렀을때 실행되는 함수
     */
    //#3. forward 실행
    //애니메이션을 play한다
    if (_animationController.isCompleted) {
      //애니메이션이 끝나면
      await _animationController.reverse(); //반대로 돈다. / panel이 닫힌다. / end->begin
    } else {
      _animationController.forward(); //정상적으로 돈다 / panel이 열린다. / begin->end
    }

    setState(() {
      //위젯트리에서 AnimatedModalBarrier를 보여주고 숨기는 역할
      //이 값이 바뀔때 build method를 실행시킨다.
      //바로 rebuild되어 AnimatedModalBarrier가 바로 사라지지 않게 하기위해서,
      //애니메이션이 끝나는것을 기다려주기 위해 _animattionController.reverse()를 await해준다.
      _showBarrier = !_showBarrier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _toggleAnimations,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('All activity'),
              Gaps.h4,
              RotationTransition(
                turns: _arrowAnimation, //animation 적용
                child: FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView(
            //ListView 전체에 padding을 줄 수 있지만 Dismissible과 ListTile의 모양을위해 New Text에 패딩을 주기로했다.
            children: [
              Gaps.v14,
              Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  //ListView에 ListTile이 아닌것도 들어올 수 있다는거
                  'New',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Gaps.v14,
              for (var notification in _notifications)
                Dismissible(
                  key: Key(notification),
                  //모든 아이템들이 다른 unique key를 가지도록
                  onDismissed: (direction) {
                    //DismissDirection direction: DismissDirection.startToEnd 왼쪽에서 오른쪽으로 밀때/ DismissDirection.endToStart 오른쪽에서 왼쪽으로 밀때
                    _onDismissed(notification); //dismiss한 아이템을 리스트에서 삭제시킨다.
                  },
                  background: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    //Container안에 있는 item들을 정렬하게해준다.
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: FaIcon(
                        FontAwesomeIcons.checkDouble,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Theme.of(context).primaryColor,
                    alignment: Alignment.centerRight,
                    //Container안에 있는 item들을 정렬하게해준다.
                    child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: FaIcon(
                        FontAwesomeIcons.trashCan,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  child: ListTile(
                    minVerticalPadding: 16,
                    //ListTile간의 세로 간격
                    onTap: () {},
                    //contentPadding: EdgeInsets.zero,
                    //If null, `EdgeInsets.symmetric(horizontal: 16.0)` is used. 원래는 16인데 왼쪽에 딱붙이려면 zero로 바꾸면 된다.
                    leading: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade400),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.bell),
                      ),
                    ),
                    title: RichText(
                      text: TextSpan(
                        text: 'Account updates:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black, //꼭써줘야한다 default가 white인듯
                          fontSize: 17,
                        ),
                        children: [
                          TextSpan(
                            text: ' Upload longer videos',
                            style: TextStyle(
                                fontWeight: FontWeight.normal), //덮어씌운다
                          ),
                          TextSpan(
                            text: ' $notification',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (_showBarrier == true)
            AnimatedModalBarrier(
              /*
            화면이 터치가 안되고 색이 바뀌게 만들어준다. Panel이 내려왔을때 ListTile 좌우로 슬라이드 안되게
             */
              color: _barrierAnimation,
              dismissible: true,
              onDismiss: _toggleAnimations,
            ),
          SlideTransition(
            position: _panelAnimation,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: Column(
                //Column은 수직축으로 가능한 한 최대 공간을 사용한다.
                mainAxisSize: MainAxisSize.min, //그걸 막아준다.
                children: [
                  for (var _tab in _tabs)
                    ListTile(
                      title: Row(
                        children: [
                          FaIcon(
                            _tab['icon'],
                            color: Colors.black,
                          ),
                          SizedBox(width: 15),
                          Text(
                            _tab['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
