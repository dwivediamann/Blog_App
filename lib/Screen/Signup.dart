// ignore_for_file: unnecessary_null_comparison

import 'package:blog_app/Screen/Login.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formkey = GlobalKey<FormState>();
  final Emailcontroll = TextEditingController();
  final Passcontroll = TextEditingController();
  final Confirmpasscontroll = TextEditingController();
  Future signupdata() async {
    String email = Emailcontroll.text.trim();
    String confirmpass = Confirmpasscontroll.text.trim();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: confirmpass);
      if (userCredential != null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Information",
                style: TextStyle(color: Colors.black),
              ),
              content: Text(
                "USer Account has been created",
                style: TextStyle(color: Colors.green),
              ),
            );
          },
        );
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    } on FirebaseAuthException catch (ex) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "SignUp Error",
              style: TextStyle(color: Colors.black),
            ),
            content: Text(
              ex.message.toString(),
              style: TextStyle(color: Colors.red),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/background.png'),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeInUp(
                            duration: Duration(seconds: 1),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1200),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1300),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            )),
                      ),
                      Positioned(
                        child: FadeInUp(
                            duration: Duration(milliseconds: 1600),
                            child: Container(
                              margin: EdgeInsets.only(top: 50),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Please Create Account!!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeInUp(
                          duration: Duration(milliseconds: 1800),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Form(
                              key: formkey,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color.fromRGBO(
                                                    143, 148, 251, 1)))),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: Emailcontroll,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700])),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter the Email";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: Passcontroll,
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700])),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter the Password";
                                        } else if (value.length < 6) {
                                          return "Password should Have Atleast 6 Charcter ";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: Divider(
                                        thickness: 1,
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: Confirmpasscontroll,
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Confirm Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[700])),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter the Password";
                                        } else if (value.length < 6) {
                                          return "Password should Have Atleast 6 Charcter ";
                                        } else if (value !=
                                            Passcontroll.text.toString()) {
                                          return "Password didnot match";
                                        }
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      FadeInUp(
                          duration: Duration(milliseconds: 1900),
                          child: GestureDetector(
                            onTap: () {
                              if (formkey.currentState!.validate()) {
                                signupdata();
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 100,
                      ),
                      FadeInUp(
                        duration: Duration(milliseconds: 2000),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                "Already Have An Account? ",
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1)),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
