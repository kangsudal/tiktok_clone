import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/discover/MyCupertinoSearchTextField.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'LIVE',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  TextEditingController _controller = TextEditingController(text: 'hello');

  void _onSearchChanged(String val) {
    //글자가 바뀔때마다
  }

  void _onSearchSubmitted(String val) {
    //검색 버튼을 눌렀을때
    print("검색버튼:$val");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap(int idx) {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false, //텍스트필드를 선택했을때 아래 공백이 생기는것을 막아준다.
        appBar: AppBar(
          title: ConstrainedBox(
            //Container도 constraints parameter를 가진다. 대체해서 쓸 수 있다.
            //검색박스가 더 커지지 않는다.
            constraints: BoxConstraints(maxWidth: Breakpoints.sm),
            child: MyCupertinoSearchTextField(
              // CupertinoSearchTextField(
              controller: _controller,
              onChanged: _onSearchChanged, //글자가 바뀔때마다
              onSubmitted: _onSearchSubmitted, //검색 버튼을 눌렀을때
            ),
          ), //ios 스타일의 검색 텍스트 필드
          elevation: 1, //AppBar에 실선 넣기
          bottom: TabBar(
            onTap: _onTap,
            //Tab을 누르면 키보드가 사라지게 만듬
            isScrollable: true,
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: Sizes.size16),
            splashFactory: NoSplash.splashFactory,
            //클릭했을때 잉크자국같은게 없도록
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              //드래그했을때 키보드가 사라지게 한다.
              itemCount: 20,
              padding: EdgeInsets.all(Sizes.size6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
                //Column의 내부 요소인 AspectRation(child:Fade...)와 Gaps와 Text를 아우를 수 있을만큼 높이가 길어져야한다.
              ),
              itemBuilder: (context, idx) => LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        //이미지가 Container를 overflow해주기때문에 BoxDecoration의 BorderRadius가 적용이안된다. 그래서 Clip.hardEdge가 필요하다.
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size6),
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 16,
                          child: FadeInImage.assetNetwork(
                            //이미지를 불러오기전에 placeholder 이미지를 보여주고 FadeIn해준다.
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/placeholder.jpg',
                            image:
                                'https://images.unsplash.com/photo-1679335649136-bd9db9e89bef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80',
                          ),
                        ),
                      ),
                      Gaps.v10,
                      Text(
                        '${constraints.maxWidth.toInt()} This is very very very very very very long #long #long',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis, //말줄임표
                        ),
                        maxLines: 2, //2줄로 제한해줘야 overflow를 막을 수 있다.
                      ),
                      Gaps.v10,
                      if (constraints.maxWidth < 200 ||
                          constraints.maxWidth > 250)
                        DefaultTextStyle(
                          //위젯 안에 들어있는 모든 TextStyle이 같게 된다.
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 12, //13부턴 AspectRatio사이즈를 넘어선다.
                              ),
                              Gaps.h4,
                              Expanded(
                                //Row에서 정해진 가로 너비가 없어서(Column에서 무한한 높이) overflow가 나서 Expanded를 해준다.
                                child: Text(
                                  'Very Very Very long nickname',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1, //1줄로 제한
                                  style: TextStyle(
                                    fontSize: 12,
                                  ), //DefaultTextStyle 위에 덮어쓸 수 있다.
                                ),
                              ),
                              Gaps.h4,
                              FaIcon(
                                FontAwesomeIcons.heart,
                                size: Sizes.size20,
                                color: Colors.grey.shade400,
                              ),
                              Gaps.h2,
                              Text(
                                "25K",
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
            for (var tab in tabs.skip(1))
              //skip(1): 첫번째 위젯으로 GridView가 와야하기때문에 Center(child:Text("top"))은 제외시킴.
              Center(
                child: Text(tab),
              ),
          ],
        ),
      ),
    );
  }
}
