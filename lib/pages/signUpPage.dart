import 'package:code_coffe_todo_list/pages/landingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  void _register() async {
    print(_emailController.text);
    try {
      User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )).user;
      if (user != null) {
        setState(() {
          _success = true;
          _userEmail = user.email;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
            return LandingPage();}));
        });
      } else {
        setState(() {
          _success = true;
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                content: Text("The password provided is too weak.")));
      } else if (e.code == 'email-already-in-use') {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
            content: Text("The account already exists for that email.")));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                            'Sign Up',
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
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            labelText: 'Password',
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
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
                            child: Text('Sign Up',style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                _register();
                              }
                            },
                          )),
                      Container(
                          child: Row(
                            children: <Widget>[
                              Text('Already have an Account'),
                              FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                textColor: Color(0xFF84A4FD),
                                child: Text(
                                  'Login in',
                                  style: TextStyle(fontSize: 20,fontFamily: "Roboto",),
                                ),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          )),
                      Container(
                        alignment: Alignment.center,
                        child: Text(_success == null
                            ? ''
                            : (_success
                            ? 'Successfully registered ' + _userEmail
                            : 'Registration failed')),
                      )
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

