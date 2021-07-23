import 'package:Bid2Win/Screens/login_page.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Verification'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text('Please verify your email-id to continue.....',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontFamily: 'Slabo27px')),
          ),
          FlatButton(
            child: Text('Go to Login Page'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return LoginPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
