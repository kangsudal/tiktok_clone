import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/onboarding/tutorial_screen.dart';
import 'package:tiktok_clone/features/onboarding/widgets/interest_button.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({Key? key}) : super(key: key);

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool showTitle = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (showTitle == true) return; //100넘어서 계속 true면 딱히 고칠필요가없다.
      setState(() {
        showTitle = true;
      });
    } else {
      setState(() {
        showTitle = false;
      });
    }
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TutorialScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const interests = [
      "Daily Life",
      "Comedy",
      "Entertainment",
      "Animals",
      "Food",
      "Beauty & Style",
      "Drama",
      "Learning",
      "Talent",
      "Sports",
      "Auto",
      "Family",
      "Fitness & Health",
      "DIY & Life Hacks",
      "Arts & Crafts",
      "Dance",
      "Outdoors",
      "Oddly Satisfying",
      "Home & Garden",
      "Daily Life",
      "Comedy",
      "Entertainment",
      "Animals",
      "Food",
      "Beauty & Style",
      "Drama",
      "Learning",
      "Talent",
      "Sports",
      "Auto",
      "Family",
      "Fitness & Health",
      "DIY & Life Hacks",
      "Arts & Crafts",
      "Dance",
      "Outdoors",
      "Oddly Satisfying",
      "Home & Garden",
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AnimatedOpacity(
          opacity: showTitle == true ? 1 : 0,
          duration: Duration(
            milliseconds: 300,
          ),
          child: Text('Choose your interests'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.size24,
          right: Sizes.size24,
          bottom: Sizes.size16,
        ),
        child: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v32,
                Text(
                  'Choose your interests',
                  style: TextStyle(
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v20,
                Text(
                  'Get better video recommendation',
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
                Gaps.v64,
                Wrap(
                  runSpacing: 15, //세로 간격조정
                  spacing: 15, //가로 간격 조정
                  children: [
                    for (var interest in interests)
                      InterestButton(interest: interest),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.only(
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
            bottom: Sizes.size40,
          ),
          child: GestureDetector(
            onTap: _onNextTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.size20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                color: Theme.of(context).primaryColor,
              ),
              child: Text(
                "Next",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Sizes.size20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
