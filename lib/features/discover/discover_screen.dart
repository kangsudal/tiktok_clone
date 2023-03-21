import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Discover"),
          elevation: 1, //AppBar에 실선 넣기
          bottom: TabBar(
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
              itemCount: 20,
              padding: EdgeInsets.all(Sizes.size6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
                //Column의 내부 요소인 AspectRation(child:Fade...)와 Gaps와 Text를 아우를 수 있을만큼 높이가 길어져야한다.
              ),
              itemBuilder: (context, idx) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 16,
                    child: FadeInImage.assetNetwork(
                      //이미지를 불러오기전에 placeholder 이미지를 보여주고 FadeIn해준다.
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/placeholder.jpg',
                      image:
                          'https://images.unsplash.com/photo-1679335649136-bd9db9e89bef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80',
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    'This is very very very very very very long #long #long',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis, //말줄임표
                    ),
                    maxLines: 2, //2줄로 제한해줘야 overflow를 막을 수 있다.
                  ),
                  Gaps.v10,
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
