import 'dart:async';

import 'package:blog_app/Blogdata/bloginfo.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 3))
        ..repeat();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogInfoPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(143, 148, 251, .6),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                      scale: _animationController.value,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/blogs.jpeg"),
                            radius: 100,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "CREATED BY:AMAN",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ],
                      ));
                },
              ),
            ],
          ),
        )));
  }
}
