import 'package:code_coffe_todo_list/pages/loginSignupPage.dart';
import 'package:code_coffe_todo_list/pages/logoAnimPage.dart';
import 'package:code_coffe_todo_list/pages/signUpPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(HeroApp());

class HeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transition Demo',
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      initialRoute:'/',
      routes: {
        '/':(context)=>LogoAnimationPage(),
        '/login':(context)=>LoginSignUpPage(),
        '/signUp':(context)=>SignUpPage(),
        /*  '/location':(context)=>ChooseLocation(),*/
      },
    );
  }
}