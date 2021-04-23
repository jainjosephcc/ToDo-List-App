import 'package:code_coffe_todo_list/pages/TestPage.dart';
import 'package:code_coffe_todo_list/screens/calendar_page.dart';
import 'package:code_coffe_todo_list/screens/class_builder.dart';
import 'package:code_coffe_todo_list/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';

class LandingPage extends StatefulWidget {

  LandingPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('MAIN', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'CALENDAR',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.calendar_today, color: Colors.white),
          page: CalendarPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'SETTINGS',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.settings, color: Colors.white),
          page: ClassBuilder.fromString('SettingsPage'),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset(
              'assets/logo.png',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN IN',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return TestPage();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromRGBO(255, 255, 255, 1.0), Color.fromRGBO(44, 72, 171, 1.0)],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}