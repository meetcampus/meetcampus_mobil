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
      appBar: AppBar(
        backgroundColor: backColorBlue,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: textColorOne,
          ),
        ),
        shadowColor: Colors.transparent,
        title: buildTitle(),
      ),
    );
  }

  Row buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('meet', style: textStyleLogo),
        Text('campus', style: textStyleLogo2),
      ],
    );
  }
}
