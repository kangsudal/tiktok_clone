import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  final Function onTap;
  final int selectedIndex;

  const NavTab({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Expanded+GestureDetector+Container(활성화된, 색을 지우면안됨)를 해줘야 선택영역이 넓어진다.
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          color: selectedIndex == 0 ? Colors.black : Colors.white,
          // Home 탭이 아니면 NavTab 배경 색을 흰색으로
          child: AnimatedOpacity(
            opacity: isSelected ? 1 : 0.6,
            duration: Duration(milliseconds: 300),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isSelected ? selectedIcon : icon,
                  color: selectedIndex == 0
                      ? Colors.white
                      : Colors.black, // Home 탭이 아니면 아이콘색상을 black으로
                ),
                Gaps.v5,
                Text(
                  text,
                  style: TextStyle(
                      color: selectedIndex == 0
                          ? Colors.white
                          : Colors.black // Home 탭이 아니면 아이콘 밑에 Text를 black으로
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
