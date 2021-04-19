import 'package:code_coffe_todo_list/UserCheckPage.dart';
import 'package:code_coffe_todo_list/pages/loginSignupPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoAnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image(image: AssetImage('assets/images/codecoffee_logo.png',),height: MediaQuery.of(context).size.height * 0.2,width: MediaQuery.of(context).size.width * 0.3,),
              )
              ,
              Hero(
                tag: 'imageHero',
                child: Image.asset(
                  'assets/images/wattodo_logo.png',width: MediaQuery.of(context).size.width * 0.8,
                ),
              ),

            ],
          ),
        ),
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return UserCheck();
          }));
        },
      ),
    );
  }
}
