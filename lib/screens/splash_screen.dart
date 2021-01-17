import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/screens/login_screen.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final dynamicHeight = MediaQuery.of(context).size.height * 0.4;
    return Scaffold(
      backgroundColor: backColorBlue,
      body: Column(
        children: [
          SafeArea(
            child: Center(
              child: Image.asset(
                'assets/icon.png',
                height: dynamicHeight,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('meet', style: textStyleLogo),
              Text('campus', style: textStyleLogo2),
            ],
          ),
          Text(
            "Let's Meet",
            style: textStyleSubTitle,
          ),
          SizedBox(
            height: dynamicHeight * 0.7,
          ),
          Image.asset(
            'assets/icons8_flying_mortarboard_480px.png',
            height: dynamicHeight * 0.2,
          )
        ],
      ),
    );
  }
}
