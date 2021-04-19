import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginSignupPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('DAshboard'),
            FlatButton(
              child: const Text('Sign out'),
              textColor: Theme
                  .of(context)
                  .buttonColor,
              onPressed: () async {
                final User user = await _auth.currentUser;
                if (user == null) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                    return LoginSignUpPage();}));
                  return;
                }
                await _auth.signOut();

                final String uid = user.uid;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                  return LoginSignUpPage();}));
              },
            )
        ],),
      ),
    );
  }
}
