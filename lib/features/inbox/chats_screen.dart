import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/inbox/chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final GlobalKey<AnimatedListState> _key =
      GlobalKey<AnimatedListState>(); //AnimatedList에 item을 추가하기위해 필요하다.

  final List<int> _items = [];
  final Duration _duration = Duration(
    milliseconds: 500,
  );

  void _addItem() {
    //AnimatedListState에 접근할 수 있도록
    if (_key.currentState != null) {
      _key.currentState!.insertItem(
        _items.length, //마지막에 아이템을 넣는다.
        //아이템을 넣을때 애니메이션 속도
        duration: _duration,
      );
      _items.add(_items.length); //모든 item을 추적할 수 있게 해준다고 한다.
    }
  }

  void _deleteItem(int index) {
    //ListTile을 길게 눌렀을때 삭제 실행
    if (_key.currentState != null) {
      //item이 제거될때도 보여줄 위젯과 애니메이션을 정해줘야한다.
      _key.currentState!.removeItem(
        index,
        (context, animation) => SizeTransition(
          sizeFactor: animation,
          child: _makeTile(index),
        ),
      );
      _items.removeAt(index);
    }
  }

  void _onChatTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(),
      ),
    );
  }

  Widget _makeTile(int index) {
    return ListTile(
      onLongPress: () => _deleteItem(index),
      onTap: _onChatTap,
      leading: CircleAvatar(
        radius: 20,
        child: Text('수달'),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '하고이 $index',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '2:31 PM',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
            ),
          )
        ],
      ),
      subtitle: Text('올때 양파좀 사와~'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Direct Messages"),
        actions: [
          IconButton(
            onPressed: () {
              _addItem();
            },
            icon: FaIcon(
              FontAwesomeIcons.plus,
            ),
          ),
        ],
      ),
      body: AnimatedList(
        //AnimatedList는 itemCount가 없다. initialItemCount밖에없다.
        //item을 추가하기위해서: GlbalKey를 추가해준다/각 item에 UniqueKey를 준다/AnimatedListState에 접근하여 item을 insert해준다.
        key: _key,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          return FadeTransition(
            key: UniqueKey(), //각 item을 구별해서 flutter가 각 item에 대해 애니메이션을 혼동하지않게
            opacity: animation,
            child: SizeTransition(
              sizeFactor: animation,
              child: _makeTile(index),
            ),
          );
        },
      ),
    );
  }
}
