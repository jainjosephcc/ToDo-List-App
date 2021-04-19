import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class ToastDisplayWidget{
  void errorToast(String msg,BuildContext context)
  {
    Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER,backgroundColor: Color(0xffef5350));
  }
  void successToast(String msg,BuildContext context)
  {
    Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER,backgroundColor: Color(0xff81c784));
  }
}