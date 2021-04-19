import 'package:code_coffe_todo_list/pages/landingPage.dart';
import 'package:code_coffe_todo_list/pages/loginSignupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          //return SomethingWentWrong();
          print(snapshot.error);
          return Text('Something Went Wrong ${snapshot.error}');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
         // return MyAwesomeApp();
          FirebaseAuth.instance
              .authStateChanges()
              .listen((User user) {
            if (user == null) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                    return LoginSignUpPage();}));
            } else {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
                return LandingPage();}));
            }
          });
        }
        //return Loading();
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: null,
                  strokeWidth: 7.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
