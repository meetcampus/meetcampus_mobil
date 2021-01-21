import 'package:flutter/material.dart';
import 'package:meetcampus_mobil/screens/class_builder.dart';
import 'package:meetcampus_mobil/screens/home.dart';
import 'package:meetcampus_mobil/utilities/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kf_drawer/kf_drawer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  KFDrawerController kfDrawerController;
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
        footer: Text(''),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment(2, 0.0),
            colors: [
              Color(0xff14698E),
              Color(0xff35A9DB),
            ],
          ),
        ),
      ),
    );
  }

  /*Drawer buildDrawer(double dynamicHeight) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Ink(
            height: dynamicHeight / 3,
            child: DrawerHeader(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: (dynamicHeight / 3) / 5),
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        maxRadius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/o1.png'),
                      ),
                      Text(
                        'Person Name and Photo',
                        style: drawerText,
                      )
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: backColorBlue,
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'home'.tr(),
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.emoji_people,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'meetgraduates'.tr(),
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '',
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '',
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '',
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'logout'.tr(),
                  style: drawerText,
                ),
              ],
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }*/
}
