import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';

// ignore: must_be_immutable
class Home extends KFDrawerContent {
  Home({
    Key key,
  });

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: textColorOne,
          ),
          onPressed: widget.onMenuPressed,
        ),
        backgroundColor: backColorBlue,
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
