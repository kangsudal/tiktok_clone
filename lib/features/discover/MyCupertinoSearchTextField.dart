import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

/*
내가 만드는 CupertinoSearchTextField
 */

class MyCupertinoSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const MyCupertinoSearchTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onSubmitted,
  }) : super(key: key);

  void _onClearText() {
    controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(
            //TextField내의 패딩
            horizontal: Sizes.size10,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefix: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 18,
              color: Colors.grey.shade500,
            ),
          ),
          suffix: GestureDetector(
            onTap: _onClearText,
            child: FaIcon(
              FontAwesomeIcons.solidCircleXmark,
              size: 20,
              color: Colors.grey.shade500,
            ),
          ),
        ),
      ),
    );
  }
}
