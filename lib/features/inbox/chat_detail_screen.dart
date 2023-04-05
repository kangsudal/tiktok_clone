import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  //우측에 스크롤이 생기도록 해준다.
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onBodyTap() {
    //body를 누르면 TextField의 focus가 사라진다.
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar title에는 Text말고 다른 위젯이 올 수 있다.
      appBar: AppBar(
        title: ListTile(
          //좌측으로 좀더 당길 수 있게된다.
          contentPadding: EdgeInsets.zero,
          //leading 과 title 사이 간격 조정
          horizontalTitleGap: 10,
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 24,
                child: Text('수달'),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightGreenAccent,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          title: Text(
            '수달이',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text('Active now'),
        ),
      ),
      //body에 Stack을 감싸는 이유는 TextField에 Positioned를 넣어주기 위해서이다.
      body: GestureDetector(
        onTap: _onBodyTap,
        child: Stack(
          children: [
            Scrollbar(
              controller: _scrollController,
              child: ListView.separated(
                controller: _scrollController,
                //하단의 TextField가 가리고있는 본문을 위하여 padding을 준다.
                padding: EdgeInsets.only(bottom: 100),
                itemBuilder: (context, idx) {
                  final isMine = idx % 2 == 0;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    //Row로 감싸준 이유는 Align을 주기위해서다.
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: isMine
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: isMine
                                ? Colors.blueAccent
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomLeft: isMine
                                  ? Radius.circular(15)
                                  : Radius.circular(3),
                              bottomRight:
                                  //not Mine이면 우측 하단에 borderRadius를 크게준다.
                                  !isMine
                                      ? Radius.circular(15)
                                      : Radius.circular(3),
                            ),
                          ),
                          child: Text(
                            "안녕",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, idx) => SizedBox(
                  height: 10,
                ),
                itemCount: 20,
              ),
            ),
            Positioned(
              bottom: 0,
              //Positioned에는 width를 넣어줘야한다.
              width: MediaQuery.of(context).size.width,
              child: BottomAppBar(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 12,
                    right: 12,
                    bottom: 20,
                  ),
                  child: Row(
                    children: [
                      //TextField에 width를 주어야 한다.
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              hintText: "Send a message...",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              // filled: true를 해줘야 적용이된다.
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                //horizontal을 주니깐 수직으로 가운데 안맞춰지던게 맞춰졌다.
                                horizontal: 10,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.faceLaugh,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            textInputAction: TextInputAction.newline,
                            // 엔터키가 되려면 expands, minLines, maxLines 설정이 세트로 되어야한다.
                            expands: true,
                            minLines: null,
                            maxLines: null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _textEditingController.clear();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade400,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.solidPaperPlane,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
