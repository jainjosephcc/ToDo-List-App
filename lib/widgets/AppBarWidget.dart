import 'package:flutter/material.dart';

Widget appbar(BuildContext context, String title, dynamic otherData) {
  return AppBar(
    toolbarHeight: 90,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(10),
      ),
    ),
    elevation: 2,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF17F386),
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {

              },
            )
        ),
      ),
    ],
    leading:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image(image: AssetImage('assets/images/user.png'),),
    ),
    title: new Text(title ,style: TextStyle(
      fontSize: 26.0,
      fontFamily: "Ubuntu",
      color: Colors.black,
      fontWeight: FontWeight.w500,
    )),
    backgroundColor: Colors.white,
  );
}
