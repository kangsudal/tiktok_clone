import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A), //텍스트필드의 커서 색깔을 바꿀 수 있다.
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        splashColor: Colors.transparent, //long press했을때 잉크번짐 효과가 사라지게한다.
        // highlightColor: Colors.transparent,//짧은 터치를 했을때도 잉크 효과가 사라진다.
      ),
      home: MainNavigationScreen(), //const SignUpScreen(),
    );
  }
}
