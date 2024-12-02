import 'package:ecommerce_app/auth/representation/view/signup.dart';
import 'package:ecommerce_app/home/representation/view/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  @override
  void initState() {
    startAnimation();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 1600),
            top: animate ? -150 : -170,
            left: animate ? -90 : -120,
            child: Container(
              width: 300,
              height: 250,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF5C6BC0),
                    Color(0xFF64B5F6),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 1600),
            top: 120,
            left: animate ? 20 : -50,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Showcase Styles",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Explore unique and creative designs",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 2400),
            left: 0,
            right: 0,
            bottom: animate ? 120 : 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Image.asset(
                "assets/images/banner3.jpg",
                height: 320,
                fit: BoxFit.cover,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 2400),
            bottom: animate ? 40 : 0,
            right: 10,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              opacity: animate ? 1 : 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF5C6BC0),
                      Color(0xFF64B5F6),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUp()));
  }
}
