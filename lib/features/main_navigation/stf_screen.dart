import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({Key? key}) : super(key: key);

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increase() {
    setState(() {
      _clicks += 1;
    });
  }

  @override
  void dispose() {
    print(_clicks);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_clicks',
              style: TextStyle(fontSize: Sizes.size40),
            ),
            TextButton(
              onPressed: _increase,
              child: Text(
                '+',
                style: TextStyle(fontSize: Sizes.size40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
