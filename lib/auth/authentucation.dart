// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _nameState();
}

class _nameState extends State<AuthWidget> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String? error = null;

  void _auth() {
    final name = _nameController.text;
    final email = _emailController.text;
    final password = _passController.text;
    this.error = null;
    if (name == 'admin' && password == 'admin' && email == 'admin') {
      print('OK');
      Navigator.of(context).pushReplacementNamed('/main_screen');
    } else {
      error = "Invalid login or password";
      print('not OK');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.error;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Sign Up', style: TextStyle(color: Colors.white))),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(height: 60),
                // ignore: prefer_const_constructors
                nameWidget(),
                SizedBox(height: 25),
                emailWidget(),
                SizedBox(height: 25),
                passWidget(),
                SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CheckBox(),
                    SizedBox(
                      width: 5,
                    ),
                    _textWidget()
                  ],
                ),
                SizedBox(height: 30),
                _signupWidget()
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Expanded _textWidget() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'By signing up, you agree to the Terms of Service and Privacy Policy'),
        ],
      ),
    );
  }

  ElevatedButton _signupWidget() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          minimumSize: Size(343, 56),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      onPressed: _auth,
      child: Text('Sign Up', style: TextStyle(fontSize: 15)),
    );
  }

  TextField emailWidget() {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: 'Email',
      ),
    );
  }

  TextField nameWidget() {
    return TextField(
      controller: _nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: 'Name',
      ),
    );
  }

  TextField passWidget() {
    return TextField(
      controller: _passController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: 'Password',
      ),
    );
  }
}

class CheckBox extends StatefulWidget {
  CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.white,
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
