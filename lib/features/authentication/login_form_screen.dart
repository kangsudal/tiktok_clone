import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({Key? key}) : super(key: key);

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String,String> formData={};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        //true면 모든 validation을 통과한것
        _formKey.currentState!.save(); //모든 TextFormField의 onSaved 를 실행
        print(formData.values);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (val) {},
                onSaved: (val) {
                  if(val != null){
                    formData['email']=val;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              Gaps.v16,
              TextFormField(
                validator: (val) {},
                onSaved: (val) {
                  if(val!=null){
                    formData['password']=val;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmitTap,
                child: const FormButton(disabled: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
