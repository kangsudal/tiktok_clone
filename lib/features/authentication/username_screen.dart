import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({Key? key}) : super(key: key);

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  String _username = "";
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'SignUp',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              Text(
                'Create username',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v8,
              Text(
                'you can always change this later.',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black54,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _usernameController,
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  hintText: "Username",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                  disabled: _username.isEmpty,
                  text: 'Sign up',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EmailScreen(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }
}
