import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/users/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text('수달'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(
                      FontAwesomeIcons.gear,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 43,
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "@수달이",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(width: 5),
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: Colors.lightBlueAccent.shade100,
                          size: 15,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      //VerticalDivider은 father의 높이를 필요로하기때문에 SizedBox로 감싸주었다.
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          indicator('37', 'Following'),
                          verticalDivdier(),
                          indicator('10.5M', "Followers"),
                          verticalDivdier(),
                          indicator('149.3M', 'Likes'),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          alignment: Alignment.center,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FaIcon(FontAwesomeIcons.youtube),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: FaIcon(FontAwesomeIcons.caretDown),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 38.0),
                      child: Text(
                        'In the Material Design language, this represents a divider. Vertical dividers can be used in horizontally scrolling lists, such as a ListView with ListView.scrollDirection set to Axis.horizontal.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: 15,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'https://kangsudal.github.io',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistentTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                //드래그했을때 키보드가 사라지게 한다.
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 9 / 13,
                  //Column의 내부 요소인 AspectRation(child:Fade...)와 Gaps와 Text를 아우를 수 있을만큼 높이가 길어져야한다.
                ),
                itemBuilder: (context, idx) => Column(
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 9 / 13,
                          child: FadeInImage.assetNetwork(
                            //이미지를 불러오기전에 placeholder 이미지를 보여주고 FadeIn해준다.
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/placeholder.jpg',
                            image:
                                'https://images.unsplash.com/photo-1679335649136-bd9db9e89bef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1935&q=80',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                              Text(
                                '4.1M',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (idx == 0)
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(3),
                              // height: 30,
                              // width: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Text(
                                'Pinned',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Text('data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget indicator(String value, String type) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          type,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade500,
          ),
        ),
      ],
    );
  }

  VerticalDivider verticalDivdier() {
    return const VerticalDivider(
      width: 45,
      thickness: 0.3,
      indent: 10,
      endIndent: 20,
      color: Colors.grey,
    );
  }
}
