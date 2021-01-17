import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backColorBlue, 
      body: Center(
        child: Text(
          'COMING SOON',
          style: textStyleLogo2,
        ),
      ),
    );
  }
}
