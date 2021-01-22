import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/screens/class_builder.dart';
import 'package:meetcampus_mobil/screens/home.dart';
import 'package:meetcampus_mobil/screens/theme_changer.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  KFDrawerController kfDrawerController;
  bool themeSwitch = false;
  var val = false;
  @override
  void initState() {
    kfDrawerController = kfDrawerControllers();

    super.initState();
  }

  KFDrawerController kfDrawerControllers() {
    return KFDrawerController(
      initialPage: ClassBuilder.fromString('Home'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('home'.tr(), style: drawerTitleTextStyle),
          icon: Icon(Icons.home, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('meetgraduates'.tr(), style: drawerTitleTextStyle),
          icon: Icon(Icons.emoji_people, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('settings'.tr(), style: drawerTitleTextStyle),
          icon: Icon(Icons.settings, color: Colors.white),
          page: Home(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('logout'.tr(), style: drawerTitleTextStyle),
          icon: Icon(Icons.logout, color: Colors.white),
          page: Home(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final dynamicWidth = MediaQuery.of(context).size.height;
    var _themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: KFDrawer(
        controller: kfDrawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: dynamicWidth * 0.8,
            child: Row(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                          image: AssetImage('assets/o2.png'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Meet Campus', style: drawerTitleTextStyle),
                    SizedBox(height: 2),
                    Text('Student', style: drawerSubTitleTextStyle),
                  ],
                )
              ],
            ),
          ),
        ),
        footer: IconButton(
          onPressed: () {
            setState(() {
              themeSwitch = !themeSwitch;
              themeSwitch
                  ? _themeChanger.setTheme(ThemeData.dark())
                  : _themeChanger.setTheme(ThemeData.light());
            });
          },
          icon: themeSwitch
              ? Icon(
                  Icons.brightness_3,
                  color: themeSwitch ? Colors.white : Colors.white,
                )
              : Icon(
                  Icons.wb_sunny,
                  color:
                      themeSwitch ? Colors.yellowAccent : Colors.yellowAccent,
                ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(1, 0.0),
            colors: [
              themeSwitch ? Color(0xff2E2E2E) : Color(0xff14698E),
              themeSwitch ? Color(0xff2C2E2C) : Color(0xff35A9DB),
            ],
          ),
        ),
      ),
    );
  }
}
