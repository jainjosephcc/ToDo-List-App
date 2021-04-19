import 'package:code_coffe_todo_list/pages/landingPage.dart';
import 'package:code_coffe_todo_list/widgets/toastWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class LoginSignUpPage extends StatefulWidget {

  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  ToastDisplayWidget toastWidget=new ToastDisplayWidget();
  bool _success;
  String _userEmail;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      if (user != null) {
        toastWidget.successToast('Successfully Logged in !', context);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return LandingPage();}));
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        toastWidget.errorToast('No user found for that email !', context);
      } else if (e.code == 'wrong-password') {
        toastWidget.errorToast('Wrong password provided for that user !', context);
      }else if (e.code == 'invalid-email') {
        toastWidget.errorToast('Invalid Email', context);
      }
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15,0,15,0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Hero(
                            tag: 'imageHero',
                            child: Image.asset(
                              'assets/images/wattodo_logo.png',width: MediaQuery.of(context).size.width * 0.4,
                            ),
                          ),),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Roboto",
                              color: Colors.black87,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            labelText: 'Email',
                            filled: true,
                            fillColor: Color(0xFFFFFCFCFC),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          obscureText: true,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          //forgot password screen
                        },
                        textColor:Color(0xFF84A4FD),
                        child: Text('Forgot Password'),
                      ),
                      Container(
                          height: 50,
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                            textColor: Colors.white,
                            color: Color(0xFF84A4FD),
                            child: Text('Login',style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _signInWithEmailAndPassword();
                              }
                            },
                          )),
                      Container(
                          child: Row(
                            children: <Widget>[
                              Text('Does not have account?'),
                              FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                textColor: Color(0xFF84A4FD),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(fontSize: 20,fontFamily: "Roboto",),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamedAndRemoveUntil('/signUp', (Route<dynamic> route) => false);
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {

        },
      ),
    );
  }
}