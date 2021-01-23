import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:meetcampus_mobil/utilities/component.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class Settings extends KFDrawerContent {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: buildTitle(),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: textColorOne,
          ),
          onPressed: widget.onMenuPressed,
        ),
        backgroundColor: backColorBlue,
        shadowColor: Colors.transparent,
        title: Text(
          'settings'.tr(),
          style: textStyleLogoAppBar2,
        ),
      ),
    );
  }
}
