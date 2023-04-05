import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
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
      body: Stack(
        children: [
          ListView.separated(
            itemBuilder: (context, idx) {
              final isMine = idx % 2 == 0;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                //Row로 감싸준 이유는 Align을 주기위해서다.
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment:
                      isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color:
                            isMine ? Colors.blueAccent : Colors.grey.shade400,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft:
                              isMine ? Radius.circular(15) : Radius.circular(3),
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
          Positioned(
            bottom: 0,
            //Positioned에는 width를 넣어줘야한다.
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    //TextField에 width를 주어야 한다.
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Send a message...",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
